#ifndef TTOASTITEM_H
#define TTOASTITEM_H

#include <QObject>
#include <QQuickItem>

class TToastItem : public QQuickItem
{
    Q_OBJECT
    Q_ENUMS(Type)

public:
    enum Type{
        Message,
        Error,
        Warning,
        Custom,
    };

    TToastItem(QQuickItem* parent = nullptr);

    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)

    Q_PROPERTY(int type READ type WRITE setType NOTIFY typeChanged)

    QString message() const;

    int type() const;

signals:
    void messageChanged(QString message);
    void typeChanged(int type);

public slots:
    void setMessage(QString message);
    void setType(int type);

private:
    QString m_message = "";
    int m_type;

};

#endif // TG_TOASTITEM_H
