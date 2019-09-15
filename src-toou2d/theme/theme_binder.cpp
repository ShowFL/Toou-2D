#include "theme_binder.h"
#include "ThemeManager.h"
#include <QDebug>
#include <QMetaMethod>
/*!
  \class ThemeBinder

  \brief

  \sa ThemeBinder
  */
ThemeBinder::ThemeBinder(QObject *parent) : QObject(parent)
{
    setEnabled(true);

    m_dynamicListener << "width" << "height" << "x" << "y";
    const QMetaObject* metaObj = this->metaObject();
    int propertyCnt = metaObj->propertyCount();
    for ( int i = 0; i < propertyCnt; ++ i )
    {
        QMetaProperty mproperty = metaObj->property(i);
        m_propertys_initfilter.append(mproperty.name());
    }

    connect(this,&ThemeBinder::stateChanged,this,[=]{
        if(m_stateAsynchronous && !ThemeManager::getInstance()->appThemeInvalid()){
            onRefreshPropertys();
        }
    },Qt::QueuedConnection);
}

void ThemeBinder::onPropertyChanged()
{
    QString pname = metaObject()->method(senderSignalIndex()).name();
    if(pname.contains("Changed")){
        QString bindingName = QString(pname.mid(0,pname.indexOf("Changed")));

        QVariant result(property(bindingName.toStdString().c_str()).type());
        QVariant change(property(bindingName.toStdString().c_str()));

        if(!ThemeManager::getInstance()->appThemeInvalid()){
            mGetThemeDataFromManager(bindingName,result);
            if(result.isValid() && result == change) return; //don't need change
        }
        this->m_binderPropertys[bindingName] = property(bindingName.toStdString().c_str());
    }
}

void ThemeBinder::onAppThemeChangedChanged()
{
    onRefreshPropertys();
}

void ThemeBinder::initialize()
{
    if(!enabled())return;
    const QMetaObject* metaObj = this->metaObject();

    //[1 step]
    int propertyCnt = metaObj->propertyCount();
    for ( int i = 0; i < propertyCnt; ++ i )
    {
        QMetaProperty mproperty = metaObj->property(i);
        if(!m_propertys_initfilter.contains(mproperty.name()) && !m_filterPropertyName.contains(mproperty.name())){
            QVariant pv(mproperty.type());
            pv.setValue(this->property(mproperty.name()));
            this->m_binderPropertys.insert(mproperty.name(),pv);
        }
    }

    //[2 step]
    QList<int> bindingindexList;
    int binderslotIndex = -1;
    int mCount = metaObj->methodCount();
    for (int i = 0; i < mCount; ++i) {
        QMetaMethod m = metaObj->method(i);
        QString name = QString::fromUtf8( m.name());
        if (m.methodType() == QMetaMethod::Signal && name.contains("Changed")){
            QString bindingName = QString(name.mid(0,name.indexOf("Changed")));
            if(this->m_binderPropertys.contains(bindingName) && m_dynamicListener.contains(bindingName)){
                bindingindexList.append(m.methodIndex());
            }
        }
        else if(m.methodType() == QMetaMethod::Slot && name == "onPropertyChanged"){
            binderslotIndex = m.methodIndex();
        }
    }

    //[3 step]
    if(binderslotIndex != -1 && bindingindexList.length() > 0){
        foreach (int key, bindingindexList) {
            QMetaObject::connect(this, key, this, binderslotIndex);
        }
    }

    //[4 step]
    foreach (ThemeBinder* binder, m_childs) {
        binder->setStateAsynchronous(m_stateAsynchronous);
        binder->setFilterPropertyName(m_filterPropertyName);
        //binder->setSendDefaultValue(m_sendDefaultValue);
        binder->setClassName(m_className);
        binder->setGroupName(m_groupName);
        binder->setEnabled(m_enabled);
        binder->setState(m_state);
        binder->setParent(this);
        binder->initialize();
    }

    if(!ThemeManager::getInstance()->appThemeInvalid()){
        onRefreshPropertys();
    }
}

void ThemeBinder::setParent(ThemeBinder *parent)
{
    if (m_parent != nullptr || m_parent == parent)
        return;

    m_parent = parent;
    emit parentChanged();

    //setSendDefaultValue(m_parent->sendDefaultValue());
    setFilterPropertyName(m_parent->filterPropertyName());
    setClassName(m_parent->className());
    setGroupName(m_parent->groupName());
    setEnabled(m_parent->enabled());
    setState(m_parent->state());
    setStateAsynchronous(m_parent->stateAsynchronous());

    connect(m_parent,&ThemeBinder::classNameChanged,this,[this](){setClassName(m_parent->className());});
    connect(m_parent,&ThemeBinder::groupNameChanged,this,[this](){setGroupName(m_parent->groupName());});
    connect(m_parent,&ThemeBinder::stateChanged,this,[this](){setState(m_parent->state());});
    connect(m_parent,&ThemeBinder::enabledChanged,this,[this](){setEnabled(m_parent->enabled());});
    connect(m_parent,&ThemeBinder::stateAsynchronousChanged,this,[this](){setStateAsynchronous(m_parent->stateAsynchronous());});
}

bool ThemeBinder::enabled() const
{
    return m_enabled;
}

const QString& ThemeBinder::groupName() const
{
    return m_groupName;
}

const QString& ThemeBinder::className() const
{
    return m_className;
}

const QString& ThemeBinder::state() const
{
    return m_state;
}

QObject *ThemeBinder::target() const
{
    return m_target;
}

int ThemeBinder::childsCount() const
{
    return m_childs.length();
}

ThemeBinder *ThemeBinder::childs(int i) const
{
    return m_childs.at(i);
}

QQmlListProperty<ThemeBinder> ThemeBinder::childs()
{
    return QQmlListProperty<ThemeBinder>(this, m_childs);
}

ThemeBinder *ThemeBinder::parent() const
{
    return m_parent;
}

QStringList ThemeBinder::filterPropertyName() const
{
    return m_filterPropertyName;
}

QStringList ThemeBinder::dynamicListener() const
{
    return m_dynamicListener;
}

bool ThemeBinder::stateAsynchronous() const
{
    return m_stateAsynchronous;
}

void ThemeBinder::setStateAsynchronous(bool stateAsynchronous)
{
    if (m_stateAsynchronous == stateAsynchronous)
        return;

    m_stateAsynchronous = stateAsynchronous;
    emit stateAsynchronousChanged();
}

void ThemeBinder::setDynamicListener(QStringList dynamicListener)
{
    if (m_dynamicListener == dynamicListener)
        return;

    m_dynamicListener = dynamicListener;
    emit dynamicListenerChanged(m_dynamicListener);
}

void ThemeBinder::setFilterPropertyName(QStringList filterPropertyName)
{
    if (m_filterPropertyName == filterPropertyName)
        return;

    m_filterPropertyName = filterPropertyName;
    emit filterPropertyNameChanged();
}

const QString ThemeBinder::childName() const
{
    return m_childName;
}

void ThemeBinder::setChildName(QString childName)
{
    if (m_childName == childName)
        return;

    m_childName = childName;
    emit childNameChanged();
}

void ThemeBinder::setTarget(QObject *target)
{
    if (m_target == target)
        return;

    m_target = target;
    emit targetChanged();
}

void ThemeBinder::setState(const QString &state)
{
    if (m_state == state || state.isEmpty())
        return;

    m_state = state;
    if(!m_stateAsynchronous && !ThemeManager::getInstance()->appThemeInvalid()){
        onRefreshPropertys();
    }
    emit stateChanged();
}

void ThemeBinder::setEnabled(bool enabled)
{
    if(m_enabled == enabled)
        return;

    m_enabled = enabled;
    if(m_enabled)
        connect(ThemeManager::getInstance(),&ThemeManager::appThemeChanged,this,&ThemeBinder::onAppThemeChangedChanged);
    else
        disconnect(ThemeManager::getInstance(),&ThemeManager::appThemeChanged,this,&ThemeBinder::onAppThemeChangedChanged);

    emit enabledChanged();
}

void ThemeBinder::setGroupName(const QString &groupName)
{
    if (m_groupName == groupName){
        return;
    }

    m_groupName = groupName;
    emit groupNameChanged();
}

void ThemeBinder::setClassName(const QString &className)
{
    if (m_className == className){
        return;
    }

    m_className = className;
    emit classNameChanged();
}

void ThemeBinder::onRefreshPropertys()
{
    if(!m_enabled)
        return;

    QObject* t = m_target == nullptr ? this : m_target;
    QMapIterator<QString, QVariant> map(this->m_binderPropertys);

    while (map.hasNext()) {
        map.next();

        if(ThemeManager::getInstance()->appThemeInvalid()){
            //send default to qml property
            QVariant result(map.value());
            t->setProperty(map.key().toStdString().c_str(),result);
        }else{
            QVariant result(map.value().type());
            mGetThemeDataFromManager(map.key(),result);
            if(result.isValid()){
                t->setProperty(map.key().toStdString().c_str(),result);
            }
        }
    }
}


bool ThemeBinder::mGetThemeDataFromManager(const QString& property,QVariant& value)
{
    QString cp = childName();
    if(parent() != nullptr && !parent()->childName().isEmpty()){
        cp = parent()->childName() + "." + cp;
    }

    QString fname = (!cp.isEmpty() ? cp + "." + property : property);

    if(!m_enabled || m_filterPropertyName.contains(fname))
        return false;

    if(m_className.isEmpty()){
        qDebug() << "Warning:Binder className cannot be null." << property;
        return false;
    }

    ThemeManager::getInstance()->getPropertyData(className(),groupName(),cp,state(),property,value);
    return true;
}
