#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>
#include <QMap>
#include <QVariantHash>
#include <QQmlEngine>
#include "theme/theme_handler.h"

class ThemeManager : public QObject
{
    Q_OBJECT
public:
    static ThemeManager *getInstance();

    static QObject *exampleQmlSingletonType(QQmlEngine *engine, QJSEngine *scriptEngine);

    // qml ListView model
    Q_PROPERTY(QVariantList themeList READ themeList /*WRITE setThemelist*/ NOTIFY themeListChanged)

    Q_PROPERTY(QString appTheme READ appTheme WRITE setAppTheme NOTIFY appThemeChanged)

    Q_PROPERTY(bool appThemeInvalid READ appThemeInvalid NOTIFY appThemeInvalidChanged)

    void addAppThemePath(const QString& path);

    void addAppTheme(const QString& name,const QString& qrc_path);

    void appStartupTheme(const QString& name);

    bool getPropertyData(const QString &className, const QString& groupName, const QString &tpName, const QString& state, const QString& property, QVariant& result);

    QString appTheme() const;

    QVariantList themeList() const;

    bool appThemeInvalid() const;

signals:
    void appThemeChanged();
    void themeListChanged();
    void appThemeInvalidChanged();

private slots:
    void setAppTheme(const QString &themeName);

private:
    static ThemeManager*        m_instance;
    QMap<QString,ThemeHandler*> m_themes;
    QString                     m_startupThemeName;
    QString                     m_themeName;
    QVariantList                m_themelist;
    bool m_appThemeInvalid;
};

#endif // THEMEMANAGER_H
