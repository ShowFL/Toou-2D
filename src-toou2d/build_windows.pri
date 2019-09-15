OUTP = $$OUT_PWD/../bin/

DESTDIR += $$OUTP/Toou2D/

OUTP = $$replace(OUTP, /, \\)
PRELINK = $$PWD\\win_install.bat PRESET $$PWD $$OUTP NONE
QMAKE_PRE_LINK += $$replace(PRELINK, /, \\)

CONFIG(sharedlib){
    INST_QMLPATH = $$[QT_INSTALL_QML]
    POSTLINK = $$PWD\win_install.bat INSTALL $$PWD $$OUTP $$INST_QMLPATH
    QMAKE_POST_LINK += $$replace(POSTLINK, /, \\)
}
