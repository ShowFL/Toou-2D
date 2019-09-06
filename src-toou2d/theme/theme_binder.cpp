#include "theme_binder.h"
#include "ThemeManager.h"
#include <QDebug>

/*!
  \class ThemeBinder

  \brief

  \sa ThemeBinder
  */
ThemeBinder::ThemeBinder(QObject *parent) : QObject(parent)
{
    setEnabled(true);

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

void ThemeBinder::initialize()
{
    if(!enabled())return;
    const QMetaObject* metaObj = this->metaObject();
    int propertyCnt = metaObj->propertyCount();
    for ( int i = 0; i < propertyCnt; ++ i )
    {
        QMetaProperty mproperty = metaObj->property(i);
        if(!m_propertys_initfilter.contains(mproperty.name()) && !m_filterPropertyName.contains(mproperty.name())){
            if(mproperty.type() == QVariant::String){
                bindingString(mproperty.name(),this->property(mproperty.name()).toString());
            }
            else if(mproperty.type() == QVariant::Color){
                bindingColor(mproperty.name(),QColor(this->property(mproperty.name()).toString()));
            }
            else if(mproperty.type() == QVariant::Double){
                bindingDouble(mproperty.name(),this->property(mproperty.name()).toDouble());
            }
            else if(mproperty.type() == QVariant::Int){
                bindingInt(mproperty.name(),this->property(mproperty.name()).toInt());
            }
            else if(mproperty.type() == QVariant::Bool){
                bindingBool(mproperty.name(),this->property(mproperty.name()).toBool());
            }
        }
    }

    foreach (ThemeBinder* binder, m_childs) {
        binder->setStateAsynchronous(m_stateAsynchronous);
        binder->setClassName(m_className);
        binder->setGroupName(m_groupName);
        binder->setEnabled(m_enabled);
        binder->setState(m_state);
        binder->setParent(this);
        binder->initialize();
    }

    onRefreshPropertys();
}

void ThemeBinder::setParent(ThemeBinder *parent)
{
    if (m_parent != nullptr || m_parent == parent)
        return;

    m_parent = parent;
    emit parentChanged(m_parent);

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

const QFont& ThemeBinder::font() const
{
    return m_font;
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

bool ThemeBinder::sendDefaultValue() const
{
    return m_sendDefaultValue;
}

ThemeBinder *ThemeBinder::parent() const
{
    return m_parent;
}

QStringList ThemeBinder::filterPropertyName() const
{
    return m_filterPropertyName;
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
    emit stateAsynchronousChanged(m_stateAsynchronous);
}

void ThemeBinder::setFilterPropertyName(QStringList filterPropertyName)
{
    if (m_filterPropertyName == filterPropertyName)
        return;

    m_filterPropertyName = filterPropertyName;
    emit filterPropertyNameChanged(m_filterPropertyName);
}

void ThemeBinder::setSendDefaultValue(bool sendDefaultValue)
{
    if (m_sendDefaultValue == sendDefaultValue)
        return;

    m_sendDefaultValue = sendDefaultValue;
    emit sendDefaultValueChanged(m_sendDefaultValue);
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
    emit childNameChanged(m_childName);
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


void ThemeBinder::setFont(const QFont &font)
{
    if (m_font == font)
        return;

    m_font = font;
    emit fontChanged();
}

int ThemeBinder::bindingInt(const QString &property, int defaultValue)
{
    QVariant value;
    mGetThemeDataFromManager(property,value);

    if(!m_propertys_int.contains(property))
        m_propertys_int.insert(property,defaultValue);

    if(value.isValid())
        return value.toInt();

    return defaultValue;
}

bool ThemeBinder::bindingBool(const QString &property, const bool &defaultValue)
{
    QVariant value;
    mGetThemeDataFromManager(property,value);

    if(!m_propertys_bool.contains(property))
        m_propertys_bool.insert(property,defaultValue);

    if(value.isValid())
        return value.toBool();

    return defaultValue;
}

QString ThemeBinder::bindingString(const QString &property, const QString &defaultValue)
{
    QVariant value;
    mGetThemeDataFromManager(property,value);

    if(!m_propertys_string.contains(property))
        m_propertys_string.insert(property,defaultValue);

    if(value.isValid())
        return value.toString();

    return defaultValue;
}

QColor ThemeBinder::bindingColor(const QString &property, const QColor &defaultValue)
{
    QVariant value;
    mGetThemeDataFromManager(property,value);

    if(!m_propertys_color.contains(property))
        m_propertys_color.insert(property,defaultValue);

    if(value.isValid())
        return QColor(value.toString());

    return defaultValue;
}

double ThemeBinder::bindingDouble(const QString& property, double defaultValue)
{
    QVariant value/*(QVariant::Double)*/;
    mGetThemeDataFromManager(property,value);

    if(!m_propertys_double.contains(property))
        m_propertys_double.insert(property,defaultValue);

    if(value.isValid())
        return value.toDouble();

    return defaultValue;
}

void ThemeBinder::setEnabled(bool enabled)
{
    if(m_enabled == enabled)
        return;

    m_enabled = enabled;
    if(m_enabled)
        connect(ThemeManager::getInstance(),&ThemeManager::appThemeChanged,this,&ThemeBinder::onRefreshPropertys);
    else
        disconnect(ThemeManager::getInstance(),&ThemeManager::appThemeChanged,this,&ThemeBinder::onRefreshPropertys);

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

    bool ctne = ThemeManager::getInstance()->appTheme().isEmpty();
    QObject* t = m_target == nullptr ? this : m_target;

    QMapIterator<QString, int> _int(this->m_propertys_int);
    while (_int.hasNext()) {
        _int.next();

        QVariant _int_data ;
        mGetThemeDataFromManager(_int.key(),_int_data);

        if(_int_data.isValid())
            t->setProperty(_int.key().toStdString().c_str(),_int_data);

        else if(m_sendDefaultValue || ctne)
            t->setProperty(_int.key().toStdString().c_str(),_int.value());
    }

    QMapIterator<QString, bool> _bool(this->m_propertys_bool);
    while (_bool.hasNext()) {
        _bool.next();

        QVariant _bool_data ;
        mGetThemeDataFromManager(_bool.key(),_bool_data);

        if(_bool_data.isValid())
            t->setProperty(_bool.key().toStdString().c_str(),_bool_data);
        else if(m_sendDefaultValue || ctne)
            t->setProperty(_bool.key().toStdString().c_str(),_bool.value());
    }

    QMapIterator<QString, QString> _string(this->m_propertys_string);
    while (_string.hasNext()) {
        _string.next();

        QVariant _string_data ;
        mGetThemeDataFromManager(_string.key(),_string_data);

        if(_string_data.isValid())
            t->setProperty(_string.key().toStdString().c_str(),_string_data);
        else if(m_sendDefaultValue || ctne)
            t->setProperty(_string.key().toStdString().c_str(),_string.value());
    }

    QMapIterator<QString, QColor> _color(this->m_propertys_color);
    while (_color.hasNext()) {
        _color.next();

        QVariant _color_data ;
        mGetThemeDataFromManager(_color.key(),_color_data);

        if(_color_data.isValid())
            t->setProperty(_color.key().toStdString().c_str(),QColor(_color_data.toString()));
        else if(m_sendDefaultValue || ctne)
            t->setProperty(_color.key().toStdString().c_str(),_color.value());
    }

    QMapIterator<QString, double> _double(this->m_propertys_double);
    while (_double.hasNext()) {
        _double.next();

        QVariant _double_data ;
        mGetThemeDataFromManager(_double.key(),_double_data);

        if(_double_data.isValid())
            t->setProperty(_double.key().toStdString().c_str(),_double_data);
        else if(m_sendDefaultValue || ctne)
            t->setProperty(_double.key().toStdString().c_str(),_double.value());
    }
}

void ThemeBinder::mGetThemeDataFromManager(const QString& property,QVariant& value)
{
    if(!m_enabled || m_filterPropertyName.contains(property) || ThemeManager::getInstance()->appThemeInvalid())
        return;

    if(m_className.isEmpty()){
        qDebug() << "Warning:Binder className cannot be null." << property;
        return;
    }

    QString cp = childName();
    if(parent() != nullptr && !parent()->childName().isEmpty()){
        cp = parent()->childName() + "." + cp;
    }

    ThemeManager::getInstance()->getPropertyData(className(),groupName(),cp,state(),property,value);
}
