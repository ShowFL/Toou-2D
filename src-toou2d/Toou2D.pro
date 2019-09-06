QT          += qml quick svg
CONFIG      += plugin c++11
TEMPLATE    = lib
TARGET      = Toou2D
TARGET      = $$qtLibraryTarget($$TARGET)
uri         = Toou2D

##########################################
#自动安装qml plugin到Qt qml目录里
CONFIG      += install

##静态库无法安装到Qt qml目录，需要配置到项目的 .pro中才可以使用
#CONFIG     += staticlib
##########################################

RESOURCES += \
    t2d_res.qrc


# Input
HEADERS += \
        qml_plugin.h \
        Toou2D.h \
        t2d.h \
        def.h \
        world.h \
        theme/theme_binder.h \
        theme/theme_handler.h \
        theme/ThemeManager.h \
        controls/interface/ttoastitem.h \
        controls/interface/tdialogitem.h \
        controls/gadget/tgadgetlabel.h \
        controls/gadget/tgadgetborder.h \
        controls/gadget/tgadgetbackground.h \
        controls/gadget/tgadgeticon.h \
        controls/gadget/tgadgetscrollbar.h \
        controls/gadget/tgadgetitem.h


SOURCES += \
        qml_plugin.cpp \
        toou2d.cpp \
        t2d.cpp \
        world.cpp \
        theme/theme_binder.cpp \
        theme/theme_handler.cpp \
        theme/ThemeManager.cpp \
        controls/interface/ttoastitem.cpp \
        controls/interface/tdialogitem.cpp \
        controls/gadget/tgadgetlabel.cpp \
        controls/gadget/tgadgetborder.cpp \
        controls/gadget/tgadgetbackground.cpp \
        controls/gadget/tgadgeticon.cpp \
        controls/gadget/tgadgetscrollbar.cpp \
        controls/gadget/tgadgetitem.cpp \
    def.cpp

DEFINES += VERSION_IN=\\\"1.0.0\\\"
DEFINES += URI_STR=\\\"$$uri\\\"

contains(QMAKE_HOST.os,Windows) {
    include(./build_windows.pri)
}else{
    include(./build_macos.pri)
}
