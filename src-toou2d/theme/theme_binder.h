#ifndef THEME_BINDER_H
#define THEME_BINDER_H

#include <QObject>
#include <QQuickItem>
#include <QVariantMap>
#include <QColor>
#include <QFont>
class ThemeBinder : public QObject
{
    Q_OBJECT
public:
    explicit ThemeBinder(QObject *parent = nullptr);

    //binding trigger getthemedata.
    Q_INVOKABLE int     bindingInt(const QString& property,int defaultValue);
    Q_INVOKABLE bool    bindingBool(const QString& property,const bool& defaultValue);
    Q_INVOKABLE QString bindingString(const QString& property,const QString& defaultValue);
    Q_INVOKABLE QColor  bindingColor(const QString& property,const QColor& defaultValue);
    Q_INVOKABLE double  bindingDouble(const QString &property, double defaultValue);


    Q_PROPERTY(QString type READ type WRITE setType)
    Q_PROPERTY(QString className READ className WRITE setClassName)
    Q_PROPERTY(QFont font READ font WRITE setFont NOTIFY fontChanged)
    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged)

    bool    enabled()   const;
    const QFont   &font()   const;
    const QString &type()   const;
    const QString &className()  const;
    const QString &state()  const;

signals:
    void enabledChanged();
    void fontChanged();
    void stateChanged();
    void typeChanged();

private slots:
    void setFont(const QFont& font);
    void setEnabled(bool enabled);
    void setType(const QString& type);
    void setClassName(const QString& className);
    void setState(const QString& state);
    void onRefreshPropertys();

private:
    bool                    m_enabled = false;
    QString                 m_type;
    QString                 m_className;

    QMap<QString,int>       m_propertys_int;
    QMap<QString,bool>      m_propertys_bool;
    QMap<QString,QString>   m_propertys_string;
    QMap<QString,QColor>    m_propertys_color;
    QMap<QString,double>    m_propertys_double;

    void mGetThemeDataFromManager(const QString& property, QVariant& value);
    QFont m_font;
    QString m_state;
};

#endif // THEME_BINDER_H
