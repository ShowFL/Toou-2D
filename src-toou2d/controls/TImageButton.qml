import QtQuick 2.6
import Toou2D 1.0

//图片按钮根据按钮状态的不同切换预设图片源。
/*! TODO */
TMouseArea{
    id:toou2d_imgbutton

    property alias theme: mtheme;

    property string source;

    property string pressSource;

    property double pressScale: 0.9;

    states: TThemeManager.appThemeInvalid ? defstates : [];

    Image {
        id:image
        anchors.fill: parent;
        source: toou2d_imgbutton.source;
    }

    property list<State> defstates: [
        State {
            name: statetoString(TStateType.Pressed)
            PropertyChanges {
                target: image
                scale: pressScale
                source:{
                    if(pressSource) return pressSource;
                    return toou2d_imgbutton.source;
                }
            }
        }
    ]

    TThemeBinder{
        id:mtheme;
        className: "TImageButton"
        state:toou2d_imgbutton.state
        target: image;

        property string source: image.source;
        property double scale:  image.scale;

        Component.onCompleted: initialize();
    }

}
