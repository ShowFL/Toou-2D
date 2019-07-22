#ifndef TDIALOGITEM_H
#define TDIALOGITEM_H

#include <QObject>
#include <QQuickItem>

class TDialogItem : public QQuickItem
{
    Q_OBJECT
    QVariant m_parameter;
public:
    TDialogItem(QQuickItem* parent = nullptr);

    Q_PROPERTY(QVariant parameter READ parameter WRITE setParameter NOTIFY parameterChanged)

    QVariant parameter() const;

signals:
    void parameterChanged(QVariant parameter);

public slots:
    void setParameter(QVariant parameter);
};

#endif // TDIALOGITEM_H
