#include "t2d.h"

#include <QFontDatabase>
#include <QQmlContext>
#include "world.h"
#include "theme/ThemeManager.h"
#include "theme/theme_binder.h"
#include "controls/interface/ttoastitem.h"
#include "controls/interface/tdialogitem.h"

T2D* T2D::m_instance = nullptr;
QObject *T2D::exampleQmlSingletonType(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return T2D::getInstance();
}

T2D *T2D::getInstance()
{
    if(T2D::m_instance == nullptr){
        T2D::m_instance = new T2D;
    }
    return T2D::m_instance;
}

QString T2D::version() const
{
    return QStringLiteral(VERSION_IN);
}

void T2D::registerTypes(const char *uri)
{
    Q_INIT_RESOURCE(t2d_res);

    qmlRegisterSingletonType<T2D>(uri,1,0,"T2D",T2D::exampleQmlSingletonType);
    qmlRegisterSingletonType<ThemeManager>(uri,1,0,"TThemeManager",ThemeManager::exampleQmlSingletonType);

    qmlRegisterType<T2DWorld>(uri,1,0,"T2DWorld");
    qmlRegisterType<ThemeBinder>(uri,1,0,"TThemeBinder");
    qmlRegisterType<TToastItem>(uri,1,0,"TToastItem");
    qmlRegisterType<TDialogItem>(uri,1,0,"TDialogItem");

    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TFpsMonitor.qml"),uri,1,0,"TFpsMonitor");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TMouseArea.qml"),uri,1,0,"TMouseArea");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TRectangle.qml"),uri,1,0,"TRectangle");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TButton.qml"),uri,1,0,"TButton");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TIconButton.qml"),uri,1,0,"TIconButton");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TImageButton.qml"),uri,1,0,"TImageButton");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TAwesomeIcon.qml"),uri,1,0,"TAwesomeIcon");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TImage.qml"),uri,1,0,"TImage");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TLabel.qml"),uri,1,0,"TLabel");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TDialog.qml"),uri,1,0,"TDialog");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TObject.qml"),uri,1,0,"TObject");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPopup.qml"),uri,1,0,"TPopup");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TBadge.qml"),uri,1,0,"TBadge");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPopover.qml"),uri,1,0,"TPopover");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPopoverElement.qml"),uri,1,0,"TPopoverElement");

    qmlRegisterSingletonType(QUrl("qrc:/net.toou.2d/controls/TToast.qml"),uri,1,0,"TToast");
}

void T2D::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(engine)
    Q_UNUSED(uri)
    m_engine = engine;
    QFontDatabase::addApplicationFont(":/net.toou.2d/resource/font/fontawesome-webfont.ttf");
    engine->rootContext()->setContextProperty("_root_window_",nullptr);
}

void T2D::initWorld(T2DWorld *world)
{
    m_world = world;

    ThemeManager::getInstance()->setThemeImportPath(m_world->importThemePath());
    ThemeManager::getInstance()->setGlobalTheme(m_world->globalTheme());
}

void T2D::initQuickRoot(QQuickWindow *root)
{
    if(m_root != nullptr){
        return;
    }
    m_root = root;
    m_engine->rootContext()->setContextProperty("_root_window_",root);
}

QString T2D::awesomeFromKey(const QString &key)
{
    if(!key.isEmpty()){
        int index = staticMetaObject.indexOfEnumerator("AwesomeType");
        return QString(staticMetaObject.enumerator(index).keysToValue(key.toStdString().c_str()));
    }

    return QString();
}

QString T2D::awesomeFromValue(int type)
{
    return QString(type);
}

QStringList T2D::awesomelist()
{
    QMetaEnum enumType = staticMetaObject.enumerator(staticMetaObject.indexOfEnumerator("AwesomeType"));
    QStringList list;
    for(int i=0; i < enumType.keyCount(); ++i){
        list.append(enumType.key(i)); //enumType.value(i)
    }
    return list;
}
