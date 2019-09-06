#include "tgadgetitem.h"


/*!
  \class TGadgetItem

  \brief

  \sa TGadgetItem
  */
TGadgetItem::TGadgetItem(QObject *parent) : QObject(parent)
{

}

int TGadgetItem::width() const
{
    return m_width;
}

int TGadgetItem::height() const
{
    return m_height;
}

void TGadgetItem::setWidth(int width)
{
    if (m_width == width)
        return;

    m_width = width;
    emit widthChanged(m_width);
}

void TGadgetItem::setHeight(int height)
{
    if (m_height == height)
        return;

    m_height = height;
    emit heightChanged(m_height);
}
