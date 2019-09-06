#include "tgadgetlabel.h"

/*!
  \class TGadgetLabel

  \brief

  \sa TGadgetLabel
  */
TGadgetLabel::TGadgetLabel(QObject *parent) : QObject(parent)
{

}

QString TGadgetLabel::text() const
{
    return m_text;
}

QColor TGadgetLabel::color() const
{
    return m_color;
}

float TGadgetLabel::scale() const
{
    return m_scale;
}

QFont TGadgetLabel::font() const
{
    return m_font;
}

void TGadgetLabel::setText(QString text)
{
    if (m_text == text)
        return;

    m_text = text;
    emit textChanged();
}

void TGadgetLabel::setColor(QColor color)
{
    if (m_color == color)
        return;

    m_color = color;
    emit colorChanged();
}

void TGadgetLabel::setScale(float scale)
{
    if (qFuzzyCompare(m_scale, scale))
        return;

    m_scale = scale;
    emit scaleChanged();

}

void TGadgetLabel::setFont(QFont font)
{
    if (m_font == font)
        return;

    m_font = font;
    emit fontChanged();
}
