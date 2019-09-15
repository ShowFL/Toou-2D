#include "tcolor.h"

TColor* TColor::m_instance = nullptr;

QColor TColor::random() const
{
    return QColor (crandom(1,255),crandom(1,255),crandom(1,255),crandom(1,255));
}

QColor TColor::primary() const
{
    return QColor("#409EFF");
}

QColor TColor::primaryLight() const
{
    return QColor("#DAECFE");
}

QColor TColor::success() const
{
    return QColor("#67C23A");
}

QColor TColor::successLight() const
{
    return QColor("#E1F2D9");
}

QColor TColor::warning() const
{
    return QColor("#E6A23C");
}

QColor TColor::warningLight() const
{
    return QColor("#FAECD9");
}

QColor TColor::danger() const
{
    return QColor("#F56C6C");
}

QColor TColor::dangerLight() const
{
    return QColor("#FCE2E2");
}

QColor TColor::info() const
{
    return QColor("#909399");
}

QColor TColor::infoLight() const
{
    return QColor("#E9E9EB");
}

/*!
    \class TColor
    \brief The qml singleton

  \sa TColor
  */
QObject *TColor::exampleQmlSingletonType(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    if(TColor::m_instance == nullptr){
        TColor::m_instance = new TColor;
    }

    return TColor::m_instance;
}
