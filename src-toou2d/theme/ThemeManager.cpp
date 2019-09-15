#include "ThemeManager.h"
#include <QDebug>
#include <QDir>
#include <QFileInfoList>

/*!
  \class ThemeManager

  \brief

  \sa ThemeManager
  */
ThemeManager* ThemeManager::m_instance = nullptr;
QObject *ThemeManager::exampleQmlSingletonType(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    return ThemeManager::getInstance();
}

ThemeManager *ThemeManager::getInstance()
{
    if(ThemeManager::m_instance == nullptr){
        ThemeManager::m_instance = new ThemeManager;
    }
    return ThemeManager::m_instance;
}

void ThemeManager::addAppThemePath(const QString &path)
{
    QString dirpath(path);
    QRegExp rx("^qrc:");
    QDir dir(dirpath.replace(rx,":"));

    if(!dir.exists()){
        qDebug() << "Warning: not directory." << path;
        return;
    }

    QFileInfoList files = dir.entryInfoList(QDir::Dirs);
    foreach (QFileInfo f, files) {
        addAppTheme(f.fileName(),f.absoluteFilePath());
    }

    if(!this->m_startupThemeName.isEmpty() && m_themes.contains(m_startupThemeName)){
        this->setAppTheme(m_startupThemeName);
    }
}

void ThemeManager::addAppTheme(const QString &name, const QString &qrc_path)
{
    ThemeHandler* theme = new ThemeHandler(name,qrc_path);
    if(!theme->isValid()){
        theme->deleteLater();
        return;
    }

    m_themes.insert(name,theme);
    emit themeListChanged();
}

void ThemeManager::appStartupTheme(const QString &name)
{
    m_startupThemeName = name;
    if(m_themes.contains(name)){
        this->setAppTheme(name);
    }
}

bool ThemeManager::getPropertyData(const QString &className, const QString &groupName, const QString &tpName ,const QString &state,const QString &property, QVariant &result)
{
    if(appThemeInvalid()) return false;

    ThemeHandler* theme = m_themes.value(m_themeName);
    if(theme){
        theme->findPropertyValue(className,groupName,tpName,state,property,result);
    }

    return theme != nullptr;
}

QString ThemeManager::appTheme() const
{
    return m_themeName;
}

QVariantList ThemeManager::themeList() const
{
    QVariantList list;
    foreach (ThemeHandler* theme, this->m_themes) {
        list.append(theme->toQVariantMap());
    }
    return list;
}

bool ThemeManager::appThemeInvalid() const
{
    return appTheme().isEmpty();
}

void ThemeManager::setAppTheme(const QString& themeName)
{
    if (m_themeName == themeName)
        return;

    if(themeName.isEmpty() || themeName == ""){
        m_themeName.clear();
        emit appThemeChanged();
    }else{
        ThemeHandler* t = m_themes.value(themeName);
        if(t && (t->isLoad() || t->load())){
            bool sendemit = !themeName.isEmpty();
            m_themeName = themeName;
            if(sendemit) emit appThemeChanged();
        }
    }
    emit appThemeInvalidChanged();
}
