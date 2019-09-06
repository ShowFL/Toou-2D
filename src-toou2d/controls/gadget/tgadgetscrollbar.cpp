#include "tgadgetscrollbar.h"

/*!
  \class TGadgetScrollbar

  \brief

  \sa TGadgetScrollbar
  */
TGadgetScrollbar::TGadgetScrollbar(QObject *parent) : QObject(parent)
{

}

bool TGadgetScrollbar::horizontal() const
{
    return m_horizontal;
}

bool TGadgetScrollbar::vertical() const
{
        return m_vertical;
}

bool TGadgetScrollbar::autoHide() const
{
    return m_autoHide;
}

void TGadgetScrollbar::setHorizontal(bool horizontal)
{
    if (m_horizontal == horizontal)
        return;

    m_horizontal = horizontal;
    emit horizontalChanged();
}

void TGadgetScrollbar::setVertical(bool vertical)
{
    if (m_vertical == vertical)
        return;

    m_vertical = vertical;
    emit verticalChanged();
}

void TGadgetScrollbar::setAutoHide(bool autoHide)
{
    if (m_autoHide == autoHide)
        return;

    m_autoHide = autoHide;
    emit autoHideChanged();
}
