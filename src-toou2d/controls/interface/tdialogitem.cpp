#include "tdialogitem.h"

TDialogItem::TDialogItem(QQuickItem *parent) :QQuickItem(parent)
{

}

QVariant TDialogItem::parameter() const
{
    return m_parameter;
}

void TDialogItem::setParameter(QVariant parameter)
{
    if (m_parameter == parameter)
        return;

    m_parameter = parameter;
    emit parameterChanged(m_parameter);
}
