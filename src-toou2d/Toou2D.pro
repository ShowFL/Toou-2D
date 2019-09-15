QT          += qml quick svg
CONFIG      += plugin c++11
TEMPLATE    = lib
TARGET      = Toou2D
TARGET      = $$qtLibraryTarget($$TARGET)
uri         = Toou2D

##########################################
CONFIG += sharedlib  # staticlib or sharedlib
#** 多次切换编译构建模式，建议先清理缓存。项目右键->清理

#*[staticlib] 构建静态库.a
#需要修改example.pro，请打开后按说明操作

#*[sharedlib] 构建动态库 .dll .so .dylib
#会自动安装到Qt qmlplugin目录中
#无需其它配置即可运行demo以及其它项目中使用
#发布目标平台前必须每个平台都要构建一次。
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
        controls/gadget/tgadgetitem.h \
        controls/gadget/tcolor.h


SOURCES += \
        qml_plugin.cpp \
        toou2d.cpp \
        t2d.cpp \
        def.cpp \
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
        controls/gadget/tcolor.cpp


DEFINES += VERSION_IN=\\\"1.0.1\\\"
DEFINES += URI_STR=\\\"$$uri\\\"

contains(QMAKE_HOST.os,Windows) {
    include(./build_windows.pri)
}else{
    include(./build_macos.pri)
}

message("-----------------------------")
message("Toou 技术交流QQ群:244808")
message("http://www.toou.net")
message("-----------------------------")
