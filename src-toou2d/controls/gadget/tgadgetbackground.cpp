#include "tgadgetbackground.h"

/*!
  \class TGadgetBackground

  \brief

  \sa TGadgetBackground
  */
TGadgetBackground::TGadgetBackground(QObject *parent) : QObject(parent)
  ,m_color("#FFF")
  ,m_opacity(1)

{

}

float TGadgetBackground::scale() const
{
    return m_scale;
}

int TGadgetBackground::radius() const
{
    return m_radius;
}

QColor TGadgetBackground::color() const
{
    return m_color;
}

bool TGadgetBackground::visible() const
{
    return m_visible;
}

int TGadgetBackground::width() const
{
    return m_width;
}

int TGadgetBackground::height() const
{
    return m_height;
}

float TGadgetBackground::opacity() const
{
    return m_opacity;
}

void TGadgetBackground::setWidth(int width)
{
    if (m_width == width)
        return;

    m_width = width;
    emit widthChanged();
}

void TGadgetBackground::setHeight(int height)
{
    if (m_height == height)
        return;

    m_height = height;
    emit heightChanged();
}

void TGadgetBackground::setOpacity(float opacity)
{
    if (qFuzzyCompare(m_opacity, opacity))
        return;

    m_opacity = opacity;
    emit opacityChanged();
}

void TGadgetBackground::setScale(float scale)
{
    if (qFuzzyCompare(m_scale, scale))
        return;

    m_scale = scale;
    emit scaleChanged();
}

void TGadgetBackground::setRadius(int radius)
{
    if (m_radius == radius)
        return;

    m_radius = radius;
    emit radiusChanged();
}

void TGadgetBackground::setColor(QColor color)
{
    if (m_color == color)
        return;

    m_color = color;
    emit colorChanged();
}

void TGadgetBackground::setVisible(bool visible)
{
    if (m_visible == visible)
        return;

    m_visible = visible;
    emit visibleChanged();
}
