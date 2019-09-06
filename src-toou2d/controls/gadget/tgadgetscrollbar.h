#ifndef TGADGETSCROLLBAR_H
#define TGADGETSCROLLBAR_H

#include <QObject>

class TGadgetScrollbar : public QObject
{
    Q_OBJECT
public:
    explicit TGadgetScrollbar(QObject *parent = nullptr);

    Q_PROPERTY(bool horizontal READ horizontal WRITE setHorizontal NOTIFY horizontalChanged)
    Q_PROPERTY(bool vertical   READ vertical   WRITE setVertical   NOTIFY verticalChanged)
    Q_PROPERTY(bool autoHide   READ autoHide   WRITE setAutoHide   NOTIFY autoHideChanged)

    bool horizontal() const;
    bool vertical()   const;
    bool autoHide()   const;

signals:
    void horizontalChanged();
    void verticalChanged();
    void autoHideChanged();

private slots:
    void setHorizontal(bool horizontal);
    void setVertical(bool vertical);
    void setAutoHide(bool autoHide);

private:
    bool m_horizontal = true;
    bool m_vertical   = true;
    bool m_autoHide   = true;

};

#endif // TGADGETSCROLLBAR_H
