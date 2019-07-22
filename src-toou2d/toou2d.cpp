#include "Toou2D.h"
#include "t2d.h"
void ToouK2D::create(QQmlEngine *engine)
{
    T2D::getInstance()->registerTypes(URI_STR);
    T2D::getInstance()->initializeEngine(engine,URI_STR);
}

QString ToouK2D::version()
{
    return T2D::getInstance()->version();
}
