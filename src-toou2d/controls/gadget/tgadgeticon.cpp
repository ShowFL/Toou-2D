#include "tgadgeticon.h"

/*!
  \class TGadgetIcon

  \brief

  \sa TGadgetIcon
  */
TGadgetIcon::TGadgetIcon(QObject *parent) : QObject(parent),m_width(18),m_height(18)
{

}

int TGadgetIcon::width() const
{
    return m_width;
}

int TGadgetIcon::height() const
{
    return m_height;
}

QColor TGadgetIcon::color() const
{
    return m_color;
}

float TGadgetIcon::scale() const
{
    return m_scale;
}

QString TGadgetIcon::source() const
{
    return m_source;
}

int TGadgetIcon::type() const
{
    return m_type;
}

int TGadgetIcon::position() const
{
    return m_position;
}

void TGadgetIcon::setPosition(int position)
{
    if (m_position == position)
        return;

    m_position = position;
    emit positionChanged(m_position);
}

void TGadgetIcon::setWidth(int width)
{
    if (m_width == width)
        return;

    m_width = width;
    emit widthChanged();
}

void TGadgetIcon::setHeight(int height)
{
    if (m_height == height)
        return;

    m_height = height;
    emit heightChanged();
}

void TGadgetIcon::setColor(QColor color)
{
    if (m_color == color)
        return;

    m_color = color;
    emit colorChanged();
}

void TGadgetIcon::setScale(float scale)
{
    if (qFuzzyCompare(m_scale, scale))
        return;

    m_scale = scale;
    emit scaleChanged();
}

void TGadgetIcon::setSource(QString source)
{
    if (m_source == source)
        return;

    m_source = source;
    emit sourceChanged();
}

void TGadgetIcon::setType(int type)
{
    if (m_type == type)
        return;

    m_type = type;
    emit typeChanged(m_type);
}
