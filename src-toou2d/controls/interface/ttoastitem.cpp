#include "ttoastitem.h"
#include <QDebug>

TToastItem::TToastItem(QQuickItem *parent) : QQuickItem(parent)
{

}

QString TToastItem::message() const
{
    return m_message;
}

int TToastItem::type() const
{
    return m_type;
}

void TToastItem::setMessage(QString message)
{

    if (m_message == message)
        return;

    m_message = message;
    emit messageChanged(m_message);
}

void TToastItem::setType(int type)
{
    if (m_type == type)
        return;

    m_type = type;
    emit typeChanged(m_type);
}
