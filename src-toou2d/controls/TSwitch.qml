import QtQuick 2.0
import Toou2D 1.0

/*!todo*/
Item {
    id:toou2d_switch;
    width:  content.width  + padding;
    height: content.height + padding;

    /*! 内边距 设置内容与外边框的间距*/
    property int   padding: 6;

    property bool checked: false;

    property alias background: mbg;

    property alias activeBackground: mactivebg;

    property alias dot:   mdot;

    property alias theme: mtheme;

    property Component dotComponent;

    property Component backgroundComponent;

    backgroundComponent: TRectangle{
        id:bg;
        theme.enabled: false;
        width:  checked ? mactivebg.width  : mbg.width;
        height: checked ? mactivebg.height : mbg.height;
        radius: checked ? mactivebg.radius : mbg.radius;
        color:  checked ? mactivebg.color  : mbg.color;
        border.width: 1;
        border.color: Qt.darker(bg.color,1.1)
    }

    dotComponent: Item{
        width:  mdot.width;
        height: mdot.height;

        TRectangle{
            theme.enabled: false;
            anchors.fill: parent;
            anchors.margins: 2;
            color: mdot.color;
            radius: mdot.radius;
        }
    }

    TGadgetBackground{
        id:mbg;
        color: "#F36D6F"
        width:  40; height: 20;
        radius:  height / 2;
    }

    TGadgetBackground{
        id:mactivebg;
        color: "#46A0FC"
        width:  40; height: 20;
        radius: height / 2;
    }

    TGadgetBackground{
        id:mdot;
        width:  20; height: 20;
        radius: height / 2;
    }

    Item{
        id:content
        anchors.centerIn: parent;
        width:  Math.max(bgloader.width,dotloader.width)
        height: Math.max(bgloader.height,dotloader.height)

        Loader{
            id:bgloader;
            sourceComponent: backgroundComponent
            anchors.verticalCenter: parent.verticalCenter;
        }

        Loader{
            id:dotloader;
            sourceComponent: dotComponent
            anchors.verticalCenter: parent.verticalCenter;
            x:checked ? content.width - width : 0;
            Behavior on x {
                NumberAnimation {
                    duration: 80
                }
            }
        }
    }

    TMouseArea{
        id:toou2d_mousearea;
        anchors.fill: parent;
        onClicked:toou2d_switch.checked = !toou2d_switch.checked;
    }

    TThemeBinder{
        id:mtheme;
        className: "TSwitch"

        TThemeBinder{
            childName: "bg"
            target: mbg;

            property color color: mbg.color;
            property int   width: mbg.width;
            property int  height: mbg.height;
            property int  radius: mbg.radius;
        }

        TThemeBinder{
            childName: "bg.active"
            target: mactivebg;

            property color color: mactivebg.color;
            property int   width: mactivebg.width;
            property int  height: mactivebg.height;
            property int  radius: mactivebg.radius;
        }

        TThemeBinder{
            childName: "dot"
            target: mdot

            property color color: mdot.color;
            property int   width: mdot.width;
            property int  height: mdot.height;
            property int  radius: mdot.radius;
        }

        Component.onCompleted: initialize();
    }

}
