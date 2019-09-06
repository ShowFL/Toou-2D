#ifndef TGADGETBORDER_H
#define TGADGETBORDER_H

#include <QColor>
#include <QObject>

class TGadgetBorder : public QObject
{
    Q_OBJECT

public:
    explicit TGadgetBorder(QObject *parent = nullptr);

    Q_PROPERTY(int    width       READ width       WRITE setWidth       NOTIFY widthChanged)
    Q_PROPERTY(QColor color       READ color       WRITE setColor       NOTIFY colorChanged)
    Q_PROPERTY(int    leftWidth   READ leftWidth   WRITE setLeftWidth   NOTIFY leftWidthChanged)
    Q_PROPERTY(int    rightWidth  READ rightWidth  WRITE setRightWidth  NOTIFY rightWidthChanged)
    Q_PROPERTY(int    topWidth    READ topWidth    WRITE setTopWidth    NOTIFY topWidthChanged)
    Q_PROPERTY(int    bottomWidth READ bottomWidth WRITE setBottomWidth NOTIFY bottomWidthChanged)
    Q_PROPERTY(bool   isValid     READ isValid                          NOTIFY isValidChanged)

    QColor color()       const;
    int    width()       const;
    int    leftWidth()   const;
    int    rightWidth()  const;
    int    topWidth()    const;
    int    bottomWidth() const;
    bool   isValid()     const;

public slots:


signals:
    void colorChanged();
    void widthChanged();
    void leftWidthChanged();
    void rightWidthChanged();
    void topWidthChanged();
    void bottomWidthChanged();
    void isValidChanged();

private slots:
    void setColor(QColor color);
    void setWidth(int width);
    void setLeftWidth(int leftWidth);
    void setRightWidth(int rightWidth);
    void setTopWidth(int topWidth);
    void setBottomWidth(int bottomWidth);

private:
    QColor m_color;
    int    m_width;
    int    m_leftWidth;
    int    m_rightWidth;
    int    m_topWidth;
    int    m_bottomWidth;
    bool   m_isValid = false;
    inline bool   hasValid();
};

#endif // TGADGETBORDER_H
