#include "theme_binder.h"
#include "ThemeManager.h"
#include <QDebug>

ThemeBinder::ThemeBinder(QObject *parent) : QObject(parent)
{
    setEnabled(true);
}

bool ThemeBinder::enabled() const
{
    return m_enabled;
}

const QString& ThemeBinder::type() const
{
    return m_type;
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

void ThemeBinder::setState(const QString &state)
{
    if (m_state == state)
        return;

    m_state = state;
    onRefreshPropertys();
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
    QVariant value(QVariant::Double);
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
        connect(ThemeManager::getInstance(),&ThemeManager::globalThemeChanged,this,&ThemeBinder::onRefreshPropertys);
    else
        disconnect(ThemeManager::getInstance(),&ThemeManager::globalThemeChanged,this,&ThemeBinder::onRefreshPropertys);

    emit enabledChanged();
}

void ThemeBinder::setType(const QString &type)
{
    if (m_type == type){
        return;
    }

    m_type = type;
    emit typeChanged();
}

void ThemeBinder::setClassName(const QString &className)
{
    if (!m_className.isEmpty()){
        qDebug() << "Warning:Don't double feed 'className'.";
        return;
    }

    m_className = className;
}

void ThemeBinder::onRefreshPropertys()
{
    if(!m_enabled)
        return;

    QMapIterator<QString, int> _int(this->m_propertys_int);
    while (_int.hasNext()) {
        _int.next();
        this->setProperty(_int.key().toStdString().c_str(),bindingInt(_int.key(),_int.value()));
    }

    QMapIterator<QString, bool> _bool(this->m_propertys_bool);
    while (_bool.hasNext()) {
        _bool.next();
        this->setProperty(_bool.key().toStdString().c_str(),bindingBool(_bool.key(),_bool.value()));
    }

    QMapIterator<QString, QString> _string(this->m_propertys_string);
    while (_string.hasNext()) {
        _string.next();
        this->setProperty(_string.key().toStdString().c_str(),bindingString(_string.key(),_string.value()));
    }

    QMapIterator<QString, QColor> _color(this->m_propertys_color);
    while (_color.hasNext()) {
        _color.next();
        this->setProperty(_color.key().toStdString().c_str(),bindingColor(_color.key(),_color.value()));
    }

    QMapIterator<QString, double> _double(this->m_propertys_double);
    while (_double.hasNext()) {
        _double.next();
        this->setProperty(_double.key().toStdString().c_str(),bindingDouble(_double.key(),_double.value()));
    }
}

void ThemeBinder::mGetThemeDataFromManager(const QString& property,QVariant& value)
{
    if(!m_enabled)
        return;

    if(m_type.isEmpty()){
        qDebug() << "Warning:Binder type cannot be null." << property;
        return;
    }

    ThemeManager::getInstance()->getPropertyData(type(),property,state(),className(),value);
}
