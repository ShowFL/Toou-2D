import QtQuick 2.6
import Toou2D 1.0

/*!
    \qmltype TButton
    \inqmlmodule QtQuick 2.6
    \brief This is a normal button
    \since 5.9.x
    \ingroup qtquicktest


    \code
    TButton{
        label.text : "TButton"
    }
    \endcode

    \sa {QtTest::TestCase}{TestCase}, {Qt Quick Test Reference Documentation}
*/
TMouseArea{
    id:toou2d_button

    width:  contentLoader.width  + padding;
    height: contentLoader.height + padding;

    readonly property alias contentWidth: contentLoader.width;
    readonly property alias contentHeight: contentLoader.height;

    property int   padding: 20;

    property alias label: label;

    property alias border: border;

    property alias background: background

    property int contentHAlign: Qt.AlignHCenter; //Qt.AlignHCenter 、 Qt.AlignLeft or Qt.AlignRight

    property alias theme: toou2d_button_theme;

    states:TThemeManager.appThemeInvalid || !theme.enabled ? defaultState : null;

    property Component backgroundComponent;

    property Component contentComponent;

    Loader{
        id:bgLoader;
        anchors.fill:    toou2d_button;
        sourceComponent: backgroundComponent ;
        visible:         toou2d_button.background.visible;
    }

    Loader{
        id:contentLoader;
        sourceComponent: contentComponent;
        anchors.verticalCenter: toou2d_button.verticalCenter;
        x:{
            if(contentHAlign == Qt.AlignLeft){
                return padding;
            }
            else if(contentHAlign == Qt.AlignRight){
                return toou2d_button.width - width - padding;
            }

            return (toou2d_button.width - width) / 2;
        }
    }

    backgroundComponent: TRectangle{
        enabled: false;
        theme.parent: toou2d_button.theme
        theme.childName: "bg"
        theme.filterPropertyName: ["width","height"];

        color:   toou2d_button.background.color;
        radius:  toou2d_button.background.radius;
        visible: toou2d_button.background.visible;
        opacity: toou2d_button.background.opacity;

        border.color: toou2d_button.border.color;
        border.width: toou2d_button.border.width;

        scale: toou2d_button_theme.scale;
    }

    contentComponent: TLabel {
        enabled: false;
        theme.parent: {
            return toou2d_button_theme;
        }

        theme.childName: "label"

        text:   toou2d_button.label.text;
        color:  toou2d_button.label.color;
        font:   toou2d_button.label.font;

        anchors.centerIn: parent;
        scale: toou2d_button_theme.scale;
    }

    TGadgetLabel{
        id:label;
        color: "#2D2D2D";
        text: "TButton";
    }

    TGadgetBorder{
        id:border;
        width: 1;
        color: "#DCDCDC";
    }

    TGadgetBackground{
        id:background;
        color: "#FCFCFC"
        radius: 2;
    }

    TThemeBinder{
        id:toou2d_button_theme;
        className: "TButton"
        state: toou2d_button.state;

        property double scale: 1;

        Component.onCompleted: initialize();
    }

    property list<State> defaultState :[
        State {
            name:statetoString(TStateType.Pressed)
            PropertyChanges {
                target: toou2d_button_theme
                scale:0.92
            }
        }
    ]
}
