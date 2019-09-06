#include "world.h"
#include "t2d.h"

bool __t2dworld_inited = false;
/*!
  \class T2DWorld

  \brief

  \sa T2DWorld
  */
T2DWorld::T2DWorld(QQuickItem* parent) : QQuickItem(parent)
{
    if(__t2dworld_inited){
        qErrnoWarning("Error:There is only one world :)");
        throw;
    }

    __t2dworld_inited = true;
    setVisible(false);
    setEnabled(false);
    connect(this,&T2DWorld::parentChanged,this,&T2DWorld::onParentChanged);
}

QStringList T2DWorld::getAppThemePaths() const
{
    qWarning() << "Please call: TThemeManager.themeList";
    return QStringList();
}

QString T2DWorld::getAppStartupTheme() const
{
    qWarning() << "Please call: TThemeManager.appTheme";
    return QString();
}

void T2DWorld::onParentChanged()
{
    disconnect(this,&T2DWorld::parentChanged,this,&T2DWorld::onParentChanged);
    T2D::getInstance()->initQuickRoot((QQuickWindow*)parent());
    T2D::getInstance()->initWorld(this);
}

void T2DWorld::setAppStartupTheme(QString appTheme)
{
    T2D::getInstance()->setAppStartupTheme(appTheme);
}

void T2DWorld::setAppThemePaths(QStringList appThemePaths)
{
    foreach (QString path, appThemePaths) {
        T2D::getInstance()->addAppThemePath(path);
    }
}
