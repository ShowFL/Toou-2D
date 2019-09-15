#ifndef TCOLOR_H
#define TCOLOR_H

#include <QObject>
#include <QColor>
#include <QDebug>
#include <QQmlEngine>
#define crandom(a,b) (rand()%(b-a+1)+a)
class TColor : public QObject
{
    Q_OBJECT
    QColor m_random;

public:
    static QObject *exampleQmlSingletonType(QQmlEngine *engine, QJSEngine *scriptEngine);
    Q_PROPERTY(QColor random       READ random       NOTIFY randomChanged)
    Q_PROPERTY(QColor primary      READ primary      NOTIFY primaryChanged)
    Q_PROPERTY(QColor primaryLight READ primaryLight NOTIFY primaryLightChanged)
    Q_PROPERTY(QColor success      READ success      NOTIFY successChanged)
    Q_PROPERTY(QColor successLight READ successLight NOTIFY lightChanged)
    Q_PROPERTY(QColor warning      READ warning      NOTIFY warningChanged)
    Q_PROPERTY(QColor warningLight READ warningLight NOTIFY warningLightChanged)
    Q_PROPERTY(QColor danger       READ danger       NOTIFY dangerChanged)
    Q_PROPERTY(QColor dangerLight  READ dangerLight  NOTIFY dangerLightChanged)
    Q_PROPERTY(QColor info         READ info         NOTIFY infoChanged)
    Q_PROPERTY(QColor infoLight    READ infoLight    NOTIFY infoLightChanged)

private:
    QColor random()       const;
    QColor primary()      const;
    QColor primaryLight() const;
    QColor success()      const;
    QColor successLight() const;
    QColor warning()      const;
    QColor warningLight() const;
    QColor danger()       const;
    QColor dangerLight()  const;
    QColor info()         const;
    QColor infoLight()    const;

signals:
    void randomChanged();
    void primaryChanged();
    void primaryLightChanged();
    void successChanged();
    void lightChanged();
    void warningChanged();
    void warningLightChanged();
    void dangerChanged();
    void dangerLightChanged();
    void infoChanged();
    void infoLightChanged();

private:
    static TColor*        m_instance;
};


#endif // TCOLOR_H
