#ifndef THEME_BINDER_H
#define THEME_BINDER_H
#include <QDebug>
#include <QObject>
#include <QObject>
#include <QVariantMap>
#include <QColor>
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

    Q_PROPERTY(QStringList dynamicListener READ dynamicListener WRITE setDynamicListener NOTIFY dynamicListenerChanged)
    Q_PROPERTY(QObject  *target READ target WRITE setTarget NOTIFY targetChanged)
    Q_PROPERTY(QString  childName READ childName WRITE setChildName NOTIFY childNameChanged)
    Q_PROPERTY(QString  groupName READ groupName WRITE setGroupName NOTIFY groupNameChanged)
    Q_PROPERTY(QString  className READ className WRITE setClassName NOTIFY classNameChanged)
    Q_PROPERTY(bool     enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    Q_PROPERTY(QString  state READ state WRITE setState NOTIFY stateChanged)
    Q_PROPERTY(bool     stateAsynchronous READ stateAsynchronous WRITE setStateAsynchronous NOTIFY stateAsynchronousChanged)
    Q_PROPERTY(QStringList filterPropertyName READ filterPropertyName WRITE setFilterPropertyName NOTIFY filterPropertyNameChanged)
    Q_PROPERTY(ThemeBinder* parent READ parent WRITE setParent NOTIFY parentChanged)
    Q_PROPERTY(QQmlListProperty<ThemeBinder> childs READ childs)
    Q_CLASSINFO("DefaultProperty", "childs")


    bool  enabled()                  const;
    const QString &groupName()       const;
    const QString &className()       const;
    const QString &state()           const;
    bool  stateAsynchronous()        const;
    const QString childName()        const;
    QObject *target()                const;
    int childsCount()                const;
    ThemeBinder *childs(int i)       const;
    QQmlListProperty<ThemeBinder> childs();
    ThemeBinder* parent()            const;
    QStringList filterPropertyName() const;
    QStringList dynamicListener()    const;

public slots:
    void setStateAsynchronous(bool stateAsynchronous);
    void setDynamicListener(QStringList dynamicListener);

signals:
    void enabledChanged();
    void stateChanged();
    void groupNameChanged();
    void classNameChanged();
    void targetChanged();
    void childNameChanged();
    void parentChanged();
    void filterPropertyNameChanged();
    void stateAsynchronousChanged();

    void dynamicListenerChanged(QStringList dynamicListener);

protected slots:
    void setFilterPropertyName(QStringList filterPropertyName);
    void setParent(ThemeBinder* parent);
    void setTarget(QObject *target);
    void setEnabled(bool enabled);
    void setGroupName(const QString& groupName);
    void setClassName(const QString& className);
    void setChildName(QString childName);
    void setState(const QString& state);
    void onRefreshPropertys();

    void onPropertyChanged();
    void onAppThemeChangedChanged();

private:
    inline bool mGetThemeDataFromManager(const QString& property, QVariant& value);
    bool                    m_enabled = false;
    QString                 m_groupName;
    QString                 m_className;


    QMap<QString,QVariant> m_binderPropertys;
    QStringList             m_propertys_initfilter;

    QString m_state;
    QObject *m_target        = nullptr;
    QList<ThemeBinder *> m_childs;
    QString m_childName;
    bool m_sendDefaultValue  = false;
    ThemeBinder* m_parent    = nullptr;
    QStringList m_filterPropertyName;
    bool m_stateAsynchronous = true;
    QStringList m_dynamicListener;
};

#endif // THEME_BINDER_H
