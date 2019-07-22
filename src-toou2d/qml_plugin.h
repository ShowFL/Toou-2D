#pragma once

#include <QQmlExtensionPlugin>

class Toou2DQmlPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    // QQmlExtensionInterface interface
    void registerTypes(const char *uri);

    void initializeEngine(QQmlEngine *engine, const char *uri);
};
