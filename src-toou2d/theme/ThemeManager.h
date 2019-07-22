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

    Q_PROPERTY(QString globalTheme READ globalTheme WRITE setGlobalTheme NOTIFY globalThemeChanged)

    // qml ListView model
    Q_PROPERTY(QVariantList themeList READ themeList /*WRITE setThemelist*/ NOTIFY themeListChanged)

    void setThemeImportPath(const QString& path);

    void addTheme(const QString& name,const QString& qrc_path);

    void getPropertyData(const QString &type, const QString& property, const QString& state, const QString& className, QVariant& value);

    QString globalTheme() const;

    QVariantList themeList() const;

signals:
    void globalThemeChanged();
    void themeListChanged();

public slots:
    void setGlobalTheme(const QString &theme);

private:
    static ThemeManager*        m_instance;
    QMap<QString,ThemeHandler*> m_themes;
    QString                     m_theme;
    QVariantList                m_themelist;
};

#endif // THEMEMANAGER_H
