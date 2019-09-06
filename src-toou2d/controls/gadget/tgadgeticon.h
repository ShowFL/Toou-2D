#ifndef TGADGETICON_H
#define TGADGETICON_H

#include <QColor>
#include <QObject>

class TGadgetIcon : public QObject
{
    Q_OBJECT
public:
    explicit TGadgetIcon(QObject *parent = nullptr);

    Q_PROPERTY(int     type     READ type     WRITE setType     NOTIFY typeChanged)
    Q_PROPERTY(QString source   READ source   WRITE setSource   NOTIFY sourceChanged)
    Q_PROPERTY(int     width    READ width    WRITE setWidth    NOTIFY widthChanged)
    Q_PROPERTY(int     height   READ height   WRITE setHeight   NOTIFY heightChanged)
    Q_PROPERTY(QColor  color    READ color    WRITE setColor    NOTIFY colorChanged)
    Q_PROPERTY(float   scale    READ scale    WRITE setScale    NOTIFY scaleChanged)
    Q_PROPERTY(int     position READ position WRITE setPosition NOTIFY positionChanged)

    int     width()    const;
    int     height()   const;
    QColor  color()    const;
    float   scale()    const;
    QString source()   const;
    int     type()     const;
    int     position() const;

signals:
    void widthChanged();
    void heightChanged();
    void colorChanged();
    void scaleChanged();
    void sourceChanged();

    void typeChanged(int type);

    void positionChanged(int position);

private slots:
    void setWidth(int width);
    void setHeight(int height);
    void setColor(QColor color);
    void setScale(float scale);
    void setSource(QString source);
    void setType(int type);
    void setPosition(int position);

private:
    int     m_width;
    int     m_height;
    int     m_type       = 0;
    int     m_position   = 0;

    float   m_scale;
    QColor  m_color;
    QString m_source;
};

#endif // TGADGETICON_H
