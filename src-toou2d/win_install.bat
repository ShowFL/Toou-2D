SET RUN_TYPE=%1
SET PRESET_PATH=%2
SET BUILDER_BIN_PATH=%3
SET QT_QML_T2D_PATH=%4

if "%RUN_TYPE%"=="PRESET" (
    copy /y "%PRESET_PATH%\Toou2D.h" "%BUILDER_BIN_PATH%"
    md %BUILDER_BIN_PATH%\Toou2D\
    copy /y "%PRESET_PATH%\build-preset\*" "%BUILDER_BIN_PATH%\Toou2D\"
) else (
    rmdir /s /q %QT_QML_T2D_PATH%\Toou2D\ & md %QT_QML_T2D_PATH%\Toou2D\
    copy /y %BUILDER_BIN_PATH%\Toou2D\ %QT_QML_T2D_PATH%\Toou2D\
)
