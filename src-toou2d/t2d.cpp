#include "t2d.h"

#include <QFontDatabase>
#include <QQmlContext>
#include "world.h"
#include "theme/ThemeManager.h"
#include "theme/theme_binder.h"
#include "controls/interface/ttoastitem.h"
#include "controls/interface/tdialogitem.h"
#include "controls/gadget/tgadgetlabel.h"
#include "controls/gadget/tgadgetborder.h"
#include "controls/gadget/tgadgetbackground.h"
#include "controls/gadget/tgadgeticon.h"
#include "controls/gadget/tgadgetscrollbar.h"
#include "controls/gadget/tgadgetitem.h"

/*!
  \class T2D

  \brief

  \sa T2D
  */

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

    int major = 1;
    int minor = 0;

    qmlRegisterSingletonType<T2D>         (uri,major,minor,"T2D",T2D::exampleQmlSingletonType);
    qmlRegisterSingletonType<ThemeManager>(uri,major,minor,"TThemeManager",ThemeManager::exampleQmlSingletonType);

    qmlRegisterType<TGadgetLabel>     (uri,major,minor,"TGadgetLabel");
    qmlRegisterType<TGadgetBorder>    (uri,major,minor,"TGadgetBorder");
    qmlRegisterType<TGadgetBackground>(uri,major,minor,"TGadgetBackground");
    qmlRegisterType<TGadgetIcon>      (uri,major,minor,"TGadgetIcon");
    qmlRegisterType<TGadgetScrollbar> (uri,major,minor,"TGadgetScrollbar");
    qmlRegisterType<TGadgetItem>      (uri,major,minor,"TGadgetItem");

    qmlRegisterType<T2DWorld>   (uri,major,minor,"T2DWorld");
    qmlRegisterType<ThemeBinder>(uri,major,minor,"TThemeBinder");
    qmlRegisterType<TToastItem> (uri,major,minor,"TToastItem");
    qmlRegisterType<TDialogItem>(uri,major,minor,"TDialogItem");

    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TObject.qml")           ,uri,major,minor,"TObject");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TMouseArea.qml")        ,uri,major,minor,"TMouseArea");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TFlickable.qml")        ,uri,major,minor,"TFlickable");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TScrollbarV.qml")       ,uri,major,minor,"TScrollbarV");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TScrollbarH.qml")       ,uri,major,minor,"TScrollbarH");

    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TFpsMonitor.qml")       ,uri,major,minor,"TFpsMonitor");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TRectangle.qml")        ,uri,major,minor,"TRectangle");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TLabel.qml")            ,uri,major,minor,"TLabel");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TImage.qml")            ,uri,major,minor,"TImage");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TDividerLine.qml")      ,uri,major,minor,"TDividerLine");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TBadge.qml")            ,uri,major,minor,"TBadge");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TTag.qml")              ,uri,major,minor,"TTag");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TAwesomeIcon.qml")      ,uri,major,minor,"TAwesomeIcon");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TSVGIcon.qml")          ,uri,major,minor,"TSVGIcon");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TButton.qml")           ,uri,major,minor,"TButton");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TIcon.qml")             ,uri,major,minor,"TIcon");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TIconButton.qml")       ,uri,major,minor,"TIconButton");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TInputField.qml")       ,uri,major,minor,"TInputField");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TAvatar.qml")           ,uri,major,minor,"TAvatar");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPagination.qml")       ,uri,major,minor,"TPagination");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TImageButton.qml")      ,uri,major,minor,"TImageButton");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TBusyIndicator.qml")    ,uri,major,minor,"TBusyIndicator");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TRadioBox.qml")         ,uri,major,minor,"TRadioBox");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TRadioBoxGroup.qml")    ,uri,major,minor,"TRadioBoxGroup");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TCheckBox.qml")         ,uri,major,minor,"TCheckBox");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TCarousel.qml")         ,uri,major,minor,"TCarousel");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TCarouselElement.qml")  ,uri,major,minor,"TCarouselElement");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPopup.qml")            ,uri,major,minor,"TPopup");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TSwitch.qml")           ,uri,major,minor,"TSwitch");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TProgressBar.qml")      ,uri,major,minor,"TProgressBar");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TNavigationBar.qml")    ,uri,major,minor,"TNavigationBar");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TNavigationElement.qml"),uri,major,minor,"TNavigationElement");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TDialogBasic.qml")           ,uri,major,minor,"TDialogBasic");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TDialog.qml")           ,uri,major,minor,"TDialog");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TDialogButton.qml")     ,uri,major,minor,"TDialogButton");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPopover.qml")          ,uri,major,minor,"TPopover");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPopoverMenu.qml")      ,uri,major,minor,"TPopoverMenu");
    qmlRegisterType(QUrl("qrc:/net.toou.2d/controls/TPopoverElement.qml")   ,uri,major,minor,"TPopoverElement");

    qmlRegisterSingletonType(QUrl("qrc:/net.toou.2d/controls/TToast.qml")   ,uri,major,minor,"TToast");

    qmlRegisterUncreatableMetaObject(Toou2D_State::staticMetaObject,    "Toou2D",major,minor,"TStateType",   "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(Toou2D_Icon::staticMetaObject,     "Toou2D",major,minor,"TIconType",    "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(Toou2D_Awesome::staticMetaObject,  "Toou2D",major,minor,"TAwesomeType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(Toou2D_Time::staticMetaObject,     "Toou2D",major,minor,"TTimePreset",  "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(Toou2D_PixelSize::staticMetaObject,"Toou2D",major,minor,"TPixelSizePreset",  "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(Toou2D_Position::staticMetaObject, "Toou2D",major,minor,"TPosition", "Access to enums & flags only");
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
}

void T2D::initQuickRoot(QQuickWindow *root)
{
    if(m_root != nullptr){
        return;
    }
    m_root = root;
    m_engine->rootContext()->setContextProperty("_root_window_",root);
}

void T2D::setAppStartupTheme(const QString &themeName)
{
    ThemeManager::getInstance()->appStartupTheme(themeName);
}

void T2D::addAppThemePath(const QString &path)
{
    ThemeManager::getInstance()->addAppThemePath(path);
}

QString T2D::awesomeFromKey(const QString &key)
{
    if(!key.isEmpty()){
        int index = Toou2D_Awesome::staticMetaObject.indexOfEnumerator("Toou2D_AwesomeType");
        return QString(Toou2D_Awesome::staticMetaObject.enumerator(index).keysToValue(key.toStdString().c_str()));
    }

    return QString();
}

QString T2D::awesomeFromValue(int type)
{
    return QString(type);
}

QStringList T2D::awesomelist()
{
    QMetaEnum enumType = Toou2D_Awesome::staticMetaObject.enumerator(Toou2D_Awesome::staticMetaObject.indexOfEnumerator("Toou2D_AwesomeType"));
    QStringList list;
    for(int i=0; i < enumType.keyCount(); ++i){
        list.append(enumType.key(i)); //enumType.value(i)
    }
    return list;
}
