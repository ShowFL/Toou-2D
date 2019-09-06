#ifndef TGADGETITEM_H
#define TGADGETITEM_H

#include <QObject>

class TGadgetItem : public QObject
{
    Q_OBJECT

public:
    explicit TGadgetItem(QObject *parent = nullptr);

    Q_PROPERTY(int width READ width WRITE setWidth NOTIFY widthChanged)
    Q_PROPERTY(int height READ height WRITE setHeight NOTIFY heightChanged)

    int width()  const;
    int height() const;
signals:

    void widthChanged(int  width);
    void heightChanged(int height);

private slots:
    void setWidth(int  width);
    void setHeight(int height);

private:
    int m_width;
    int m_height;
};

#endif // TGADGETITEM_H
