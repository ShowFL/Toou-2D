OUTP = $$OUT_PWD/../bin/
DESTDIR += $$OUTP

COPY_FILELIST += COPY:: $$PWD/build-preset/qmldir TODIR:: \
                 COPY:: $$PWD/build-preset/plugin.qmltypes TODIR:: \
                 COPY:: $$PWD/Toou2D.h TODIREND::

OUTP = $$replace(OUTP, /, \\)

COPY_FILELIST = $$replace(COPY_FILELIST, /, \\)
COPY_FILELIST = $$replace(COPY_FILELIST, COPY::, copy /y)
COPY_FILELIST = $$replace(COPY_FILELIST, TODIR::, $$OUTP && )
COPY_FILELIST = $$replace(COPY_FILELIST, TODIREND::, $$OUTP)

QMAKE_POST_LINK += $$COPY_FILELIST

CONFIG(install){
    CONFIG -= staticlib

    INST_QMLPATH_WIN32 = $$[QT_INSTALL_QML]\Toou2D
    INST_QMLPATH_WIN32 = $$replace(INST_QMLPATH_WIN32, /, \\)

    !exists($$INST_QMLPATH_WIN32){
        QMAKE_PRE_LINK += md $$INST_QMLPATH_WIN32
    }

    QMAKE_POST_LINK += && copy /y $$OUTP*.* $$INST_QMLPATH_WIN32
}
