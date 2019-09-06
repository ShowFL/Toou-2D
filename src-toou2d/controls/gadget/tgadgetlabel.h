#ifndef TGADGETLABEL_H
#define TGADGETLABEL_H

#include <QColor>
#include <QFont>
#include <QObject>

class TGadgetLabel : public QObject
{
    Q_OBJECT

public:
    explicit TGadgetLabel(QObject *parent = nullptr);

    Q_PROPERTY(QString  text  READ text  WRITE setText  NOTIFY textChanged)
    Q_PROPERTY(QColor   color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(float    scale READ scale WRITE setScale NOTIFY scaleChanged)
    Q_PROPERTY(QFont    font  READ font  WRITE setFont  NOTIFY fontChanged)
    Q_PROPERTY(int font_size READ font_size WRITE setFont_size NOTIFY font_sizeChanged)

    QString text() const;
    QColor  color() const;
    float   scale() const;
    QFont   font() const;

    int font_size() const
    {
        return m_font_size;
    }

public slots:
    void setFont_size(int font_size)
    {
        if (m_font_size == font_size)
            return;

        m_font_size = font_size;
        emit font_sizeChanged(m_font_size);
    }

signals:
    void textChanged();
    void colorChanged();
    void scaleChanged();
    void fontChanged();

    void font_sizeChanged(int font_size);

private slots:
    void setText(QString text);
    void setColor(QColor color);
    void setScale(float scale);
    void setFont(QFont font);

private:
    QString m_text;
    QColor  m_color;
    float   m_scale;
    QFont   m_font;

    int m_font_size;
};

#endif // TGADGETLABEL_H
