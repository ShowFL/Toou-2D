#include "qml_plugin.h"
#include "t2d.h"

void Toou2DQmlPlugin::registerTypes(const char *uri)
{
    // @uri Toou2D
    T2D::getInstance()->registerTypes(uri);
}

void Toou2DQmlPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    T2D::getInstance()->initializeEngine(engine,uri);
}

