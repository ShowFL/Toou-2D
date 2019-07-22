#include "ThemeManager.h"
#include <QDebug>
#include <QDir>
#include <QFileInfoList>

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

void ThemeManager::setThemeImportPath(const QString &path)
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
        addTheme(f.fileName(),f.absoluteFilePath());
    }
}

void ThemeManager::addTheme(const QString &name, const QString &qrc_path)
{
    ThemeHandler* theme = new ThemeHandler(name,qrc_path);
    if(!theme->isValid()){
        theme->deleteLater();
        return;
    }

    m_themes.insert(name,theme);
    emit themeListChanged();
}

void ThemeManager::getPropertyData(const QString &type, const QString &property, const QString &state, const QString &className, QVariant &value)
{
    //Theme not loaded, need to load default.
    if(m_theme.isEmpty() && m_themes.count() > 0){
        if(m_themes.contains("default"))
            setGlobalTheme("default");
        else
            setGlobalTheme(m_themes.keys().first());
    }


    ThemeHandler* theme = m_themes.value(m_theme);
    if(theme){
        theme->findPropertyValue(type,property,state,className,value);
    }
}

QString ThemeManager::globalTheme() const
{
    return m_theme;
}

QVariantList ThemeManager::themeList() const
{
    QVariantList list;
    foreach (ThemeHandler* theme, this->m_themes) {
        list.append(theme->toQVariantMap());
    }
    return list;
}

void ThemeManager::setGlobalTheme(const QString& theme)
{
    if (m_theme == theme)
        return;

    ThemeHandler* t = m_themes.value(theme);
    if(t && (t->isLoad() || t->load())){
        bool sendemit = !theme.isEmpty();
        m_theme = theme;
        if(sendemit) emit globalThemeChanged();
    }
}
