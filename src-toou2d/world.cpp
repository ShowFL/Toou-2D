#include "world.h"
#include "t2d.h"

bool __t2dworld_inited = false;
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


QString T2DWorld::importThemePath() const
{
    return m_importThemePath;
}

QString T2DWorld::globalTheme() const
{
    return m_globalTheme;
}

void T2DWorld::setImportThemePath(const QString &importThemePath)
{
    if (m_importThemePath == importThemePath)
        return;

    m_importThemePath = importThemePath;
    emit importThemePathChanged();
}

void T2DWorld::setGlobalTheme(const QString &globalTheme)
{
    if (m_globalTheme == globalTheme)
        return;

    m_globalTheme = globalTheme;
    emit globalThemeChanged();
}

void T2DWorld::onParentChanged()
{
    disconnect(this,&T2DWorld::parentChanged,this,&T2DWorld::onParentChanged);
    T2D::getInstance()->initQuickRoot((QQuickWindow*)parent());
    T2D::getInstance()->initWorld(this);
}
