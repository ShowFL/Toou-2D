OUTP = $$OUT_PWD/../bin/

DESTDIR += $$OUTP

QMAKE_MOC_OPTIONS += -Muri=$$uri
COPY_FILELIST += $$PWD/build-preset/qmldir \
                 $$PWD/build-preset/plugin.qmltypes \
                 $$PWD/Toou2D.h

QMAKE_POST_LINK += $$QMAKE_COPY $$COPY_FILELIST $$OUTP;

CONFIG(install){
    CONFIG -= staticlib
    INST_QMLPATH = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

    QMAKE_PRE_LINK += mkdir -pv $$INST_QMLPATH;

    QMAKE_POST_LINK += $$QMAKE_COPY $$OUTP/* $$INST_QMLPATH;

    exists($$PWD/../../dev.pri){
        include($$PWD/../../dev.pri)
    }
}
