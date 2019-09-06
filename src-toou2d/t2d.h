#ifndef T2D_H
#define T2D_H

#include <QObject>
#include <QQmlEngine>
#include <QQuickWindow>
#include "world.h"
#include "def.h"

class T2D : public QObject
{
    Q_OBJECT

public:
    static QObject  *exampleQmlSingletonType(QQmlEngine *engine, QJSEngine *scriptEngine);
    static T2D      *getInstance();

    Q_INVOKABLE QString     version() const;
    Q_INVOKABLE QString     awesomeFromKey(const QString& key);
    Q_INVOKABLE QString     awesomeFromValue(int type);
    Q_INVOKABLE QStringList awesomelist();

    void registerTypes(const char *uri);
    void initializeEngine(QQmlEngine *engine, const char *uri);

    void initWorld(T2DWorld* world);
    void initQuickRoot(QQuickWindow* root);

    void setAppStartupTheme(const QString& themeName);
    void addAppThemePath(const QString& path);
signals:

private:
    static T2D* m_instance;

    QQmlEngine* m_engine        = nullptr;
    QQuickWindow* m_root        = nullptr;
    T2DWorld* m_world           = nullptr;
};

#endif // T2D_H
