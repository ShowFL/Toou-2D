#ifndef TGADGETBACKGROUND_H
#define TGADGETBACKGROUND_H

#include <QColor>
#include <QObject>

class TGadgetBackground : public QObject
{
    Q_OBJECT

public:
    explicit TGadgetBackground(QObject *parent = nullptr);

    Q_PROPERTY(int    width   READ width   WRITE setWidth   NOTIFY widthChanged)
    Q_PROPERTY(int    height  READ height  WRITE setHeight  NOTIFY heightChanged)
    Q_PROPERTY(float  scale   READ scale   WRITE setScale   NOTIFY scaleChanged)
    Q_PROPERTY(QColor color   READ color   WRITE setColor   NOTIFY colorChanged)
    Q_PROPERTY(int    radius  READ radius  WRITE setRadius  NOTIFY radiusChanged)
    Q_PROPERTY(float opacity READ opacity WRITE setOpacity  NOTIFY opacityChanged)
    Q_PROPERTY(bool   visible READ visible WRITE setVisible NOTIFY visibleChanged)


    QColor color()   const;
    float  scale()   const;
    float  opacity() const;
    bool   visible() const;
    int    radius()  const;
    int    width()   const;
    int    height()  const;

signals:
    void scaleChanged();
    void radiusChanged();
    void colorChanged();
    void visibleChanged();
    void widthChanged();
    void heightChanged();
    void opacityChanged();

private slots:
    void setWidth(int width);
    void setHeight(int height);
    void setOpacity(float opacity);
    void setScale(float scale);
    void setRadius(int radius);
    void setColor(QColor color);
    void setVisible(bool visible);

private:

    QColor m_color;
    int    m_radius = 0;
    int    m_width;
    int    m_height;
    float  m_opacity = 1;
    float  m_scale = 1;
    bool   m_visible = true;
};

#endif // TGADGETBACKGROUND_H
