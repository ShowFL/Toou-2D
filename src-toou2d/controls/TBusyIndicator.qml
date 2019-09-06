import QtQuick 2.6
import Toou2D 1.0

//! 加载数据时显示动效。
//    在容器中加载数据时显示。
//    避免ui线程卡顿请使用Animator动画处理
/*! TODO */
Item {
    id:toou2d_busyindicatior;
    width:  contentWidth + padding;
    height: contentWidth + padding;

    readonly property int contentWidth: loader.width;

    readonly property int contentHeight: loader.height;

    property int padding: 5;

    property int  duration: 500;

    property alias icon:  micon;

    property alias color: micon.color;

    property alias theme: mtheme;

    property alias running: toou2d_busyindicatior.visible;

    property Component contentComponent : defaultIconAnimator;

    TGadgetIcon{
        id:micon
        source: TAwesomeType.FA_circle_o_notch;
        color:  "#5D5D5D"
    }

    Loader{
        id:loader;
        anchors.centerIn: parent;
        sourceComponent: contentComponent;
    }

    TThemeBinder{
        id:mtheme
        className: "TBusyIndicator"

        property alias source: micon.source;
        property alias color:  micon.color;
        property alias size:   toou2d_busyindicatior.width;

        Component.onCompleted: initialize();
    }


    readonly property Component defaultIconAnimator: TAwesomeIcon{
        source: icon.source;
        color:  icon.color;
        theme.enabled: false;
        width: 26;
        height: 26;
        RotationAnimator on rotation {
            from: 0;
            to: 360;
            duration:toou2d_busyindicatior.duration;
            running: toou2d_busyindicatior.visible;
            loops:   Animation.Infinite;
        }
    }

    readonly property Component defaultDotAnimator:Row{
        id:contentLayout;
        spacing: 5;
        Repeater{
            model: 3;
            delegate: TRectangle{
                width: 12;
                height: 12;
                radius: 6;
                color:  toou2d_busyindicatior.color;
                theme.enabled: false;
                property bool animrun: false;
                SequentialAnimation on scale {
                    running: animrun;
                    loops:   Animation.Infinite;
                    ScaleAnimator {from: 1;to: 0.2;duration:600;}
                    ScaleAnimator {from: 0.2;to: 1;duration:600;}
                }
            }
        }

        Timer {
            id:delay;
            interval: 200;
            repeat: true
            property int count: contentLayout.children.length;
            property int i: 0;
            onTriggered: {
                if(contentLayout.children[i].animrun !== "undefined"){
                    contentLayout.children[i].animrun = true;
                }
                if(++i >= count - 1)stop();
            }
        }

        Component.onCompleted: delay.start();
    }
}
