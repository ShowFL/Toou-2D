#include "tgadgetborder.h"

/*!
  \class TGadgetBorder

  \brief

  \sa TGadgetBorder
  */
TGadgetBorder::TGadgetBorder(QObject *parent) : QObject(parent)
  ,m_color("#5D5D5D")
  ,m_width(0)
  ,m_leftWidth(0)
  ,m_rightWidth(0)
  ,m_topWidth(0)
  ,m_bottomWidth(0)
{

}

QColor TGadgetBorder::color() const
{
    return m_color;
}

int TGadgetBorder::width() const
{
    return m_width;
}

int TGadgetBorder::leftWidth() const
{
    return m_leftWidth;
}

int TGadgetBorder::rightWidth() const
{
    return m_rightWidth;
}

int TGadgetBorder::topWidth() const
{
    return m_topWidth;
}

int TGadgetBorder::bottomWidth() const
{
    return m_bottomWidth;
}

bool TGadgetBorder::isValid() const
{
    return m_isValid;
}

void TGadgetBorder::setLeftWidth(int leftWidth)
{
    if (m_leftWidth == leftWidth)
        return;

    m_leftWidth = leftWidth;
    emit leftWidthChanged();
    hasValid();
}

void TGadgetBorder::setRightWidth(int rightWidth)
{
    if (m_rightWidth == rightWidth)
        return;

    m_rightWidth = rightWidth;
    emit rightWidthChanged();
    hasValid();
}

void TGadgetBorder::setTopWidth(int topWidth)
{
    if (m_topWidth == topWidth)
        return;

    m_topWidth = topWidth;
    emit topWidthChanged();
    hasValid();
}

void TGadgetBorder::setBottomWidth(int bottomWidth)
{
    if (m_bottomWidth == bottomWidth)
        return;

    m_bottomWidth = bottomWidth;
    emit bottomWidthChanged();
    hasValid();
}

bool TGadgetBorder::hasValid()
{
    bool v = m_width > 0 || m_bottomWidth > 0 || m_topWidth > 0 || m_leftWidth > 0 || m_rightWidth > 0;
    if(v != m_isValid){
        m_isValid = v;
        emit isValidChanged();
    }
    return v;
}

void TGadgetBorder::setColor(QColor color)
{
    if (m_color == color)
        return;

    m_color = color;
    emit colorChanged();
}

void TGadgetBorder::setWidth(int width)
{
    if (m_width == width)
        return;

    m_width = width;
    emit widthChanged();
    hasValid();
}
