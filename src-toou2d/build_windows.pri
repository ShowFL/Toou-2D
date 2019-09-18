OUTP = $$OUT_PWD/../bin/Toou2D
BUILDBIN_PATH = $$replace(OUTP, src-toou2d/../bin, bin)
QTQMLT2D_PATH = $$[QT_INSTALL_QML]/Toou2D
PRESET_PATH = $$PWD/build-preset
SOLIBFILE_PATH = $$OUT_PWD/libToou2D.so
ANDROID = NO

android{
    ANDROID=YES
    QMAKE_PRE_LINK *= md $$replace(OUTP, /, \\)
}else{
    DESTDIR += $$OUTP
}

SHAREDSCRIPT = "$$PWD\win_install.bat" SHARED "$$PWD" "$$PRESET_PATH" "$$BUILDBIN_PATH" "$$QTQMLT2D_PATH" $$ANDROID "$$SOLIBFILE_PATH"
STATICSCRIPT = "$$PWD\win_install.bat" STATIC "$$PWD" "$$PRESET_PATH" "$$BUILDBIN_PATH" "$$QTQMLT2D_PATH" $$ANDROID "$$SOLIBFILE_PATH"

CONFIG(sharedlib){
    QMAKE_POST_LINK *= $$replace(SHAREDSCRIPT, /, \\)
}
else{
    QMAKE_POST_LINK *= $$replace(STATICSCRIPT, /, \\)
}
