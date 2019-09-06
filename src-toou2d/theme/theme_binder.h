#ifndef THEME_BINDER_H
#define THEME_BINDER_H

#include <QObject>
#include <QObject>
#include <QVariantMap>
#include <QColor>
#include <QFont>
#include <QQmlListProperty>
class ThemeBinder : public QObject
{
    Q_OBJECT
public:
    explicit ThemeBinder(QObject *parent = nullptr);

    /**
     * binding trigger themedata
     * 他是非常重要的，他能够推动一个皮肤绑定器正常的运作。
     * 必须在QML中 Component.onCompleted: initialize();
     */
    Q_INVOKABLE void    initialize();

    Q_INVOKABLE int     bindingInt(const    QString& property, int    defaultValue);
    Q_INVOKABLE bool    bindingBool(const   QString& property, const bool& defaultValue);
    Q_INVOKABLE QString bindingString(const QString& property, const QString& defaultValue);
    Q_INVOKABLE QColor  bindingColor(const  QString& property, const QColor& defaultValue);
    Q_INVOKABLE double  bindingDouble(const QString& property, double defaultValue);

    Q_PROPERTY(QObject  *target READ target WRITE setTarget NOTIFY targetChanged)
    Q_PROPERTY(QString  childName READ childName WRITE setChildName NOTIFY childNameChanged)
    Q_PROPERTY(QString  groupName READ groupName WRITE setGroupName NOTIFY groupNameChanged)
    Q_PROPERTY(QString  className READ className WRITE setClassName NOTIFY classNameChanged)
    Q_PROPERTY(QFont    font READ font WRITE setFont NOTIFY fontChanged)
    Q_PROPERTY(bool     enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    Q_PROPERTY(QString  state READ state WRITE setState NOTIFY stateChanged)
    /*!状态发生改变，会重新获取皮肤样式，异步操作不会影响原有绑定设置。例如TCheckBox enable设置*/
    Q_PROPERTY(bool     stateAsynchronous READ stateAsynchronous WRITE setStateAsynchronous NOTIFY stateAsynchronousChanged)
    Q_PROPERTY(bool     sendDefaultValue READ sendDefaultValue WRITE setSendDefaultValue NOTIFY sendDefaultValueChanged)
    Q_PROPERTY(QStringList filterPropertyName READ filterPropertyName WRITE setFilterPropertyName NOTIFY filterPropertyNameChanged)
    Q_PROPERTY(ThemeBinder* parent READ parent WRITE setParent NOTIFY parentChanged)
    Q_PROPERTY(QQmlListProperty<ThemeBinder> childs READ childs)
    Q_CLASSINFO("DefaultProperty", "childs")

     bool    enabled()           const;
    const QFont   &font()        const;
    const QString &groupName()   const;
    const QString &className()   const;
    const QString &state()       const;
    bool stateAsynchronous() const;
    const QString childName()  const;

    QObject *target()            const;
    int childsCount()            const;
    ThemeBinder *childs(int i)   const;
    QQmlListProperty<ThemeBinder> childs();
    bool sendDefaultValue()      const;
    ThemeBinder* parent()        const;
    QStringList filterPropertyName() const;

public slots:
    void setStateAsynchronous(bool stateAsynchronous);

signals:
    void enabledChanged();
    void fontChanged();
    void stateChanged();
    void groupNameChanged();
    void classNameChanged();
    void targetChanged();
    void childNameChanged(QString childName);
    void sendDefaultValueChanged(bool sendDefaultValue);
    void parentChanged(ThemeBinder* parent);
    void filterPropertyNameChanged(QStringList filterPropertyName);
    void stateAsynchronousChanged(bool stateAsynchronous);

protected slots:
    void setFilterPropertyName(QStringList filterPropertyName);
    void setSendDefaultValue(bool sendDefaultValue);
    void setParent(ThemeBinder* parent);
    void setTarget(QObject *target);
    void setFont(const QFont& font);
    void setEnabled(bool enabled);
    void setGroupName(const QString& groupName);
    void setClassName(const QString& className);
    void setChildName(QString childName);
    void setState(const QString& state);
    void onRefreshPropertys();

private:
   inline void mGetThemeDataFromManager(const QString& property, QVariant& value);
    bool                    m_enabled = false;
    QString                 m_groupName;
    QString                 m_className;

    QMap<QString,int>       m_propertys_int;
    QMap<QString,bool>      m_propertys_bool;
    QMap<QString,QString>   m_propertys_string;
    QMap<QString,QColor>    m_propertys_color;
    QMap<QString,double>    m_propertys_double;
    QStringList             m_propertys_initfilter;

    QFont   m_font;
    QString m_state;
    QObject *m_target        = nullptr;
    QList<ThemeBinder *> m_childs;
    QString m_childName;
    bool m_sendDefaultValue  = false;
    ThemeBinder* m_parent    = nullptr;
    QStringList m_filterPropertyName;
    bool m_stateAsynchronous = true;
};

#endif // THEME_BINDER_H
