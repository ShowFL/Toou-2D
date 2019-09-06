#ifndef T2DWORLD_H
#define T2DWORLD_H

#include <QObject>
#include <QQuickItem>

/***
 * 整个Toou 2D框架中非常重要的一个类。
 * 除了可以初始化皮肤路径及设置启动皮肤外
 * T2D还对整个应用系统进行了初始化设置。
 * 并且他必须要创建在App ApplicationWindow 下面。
 *
 * QML:
 * T2DWorld{
 *       appStartupTheme: "dark"
 *       appThemePaths:[
 *           "qrc:/themes/"
 *       ]
 * }
 * */
class T2DWorld : public QQuickItem
{
    Q_OBJECT

public:
    T2DWorld(QQuickItem* parent = nullptr);

    /***
     * 设置App启动时默认加载皮肤。
     * 此属性只能设置一次。App启动再设置将无效。
     * APP启动后，可以通过TThemeManager 来进行皮肤样式切换。
     * */
    Q_PROPERTY(QString appStartupTheme READ getAppStartupTheme WRITE setAppStartupTheme)

    /***
     * 导入皮肤的路径
     * 可以设置多个不同的路径。满足各种设计需求。可以是QRC内部，APP外部等。
     * */
    Q_PROPERTY(QStringList appThemePaths READ getAppThemePaths WRITE setAppThemePaths)

    QStringList getAppThemePaths() const;
    QString   getAppStartupTheme() const;

private slots:
    void onParentChanged();
    void setAppStartupTheme(QString themeName);
    void setAppThemePaths(QStringList appThemePaths);

};

#endif // T2DWORLD_H
