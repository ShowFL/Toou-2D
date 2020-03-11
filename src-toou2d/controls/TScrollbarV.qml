import QtQuick 2.6
import Toou2D  1.0

/* 滚动条-竖向
滚动条可配合 Qt ListView ，Qt Flickable ,等等使用。
 TScrllbarV{
    target:listView;
 }

*/
/*! TODO */
Item {
    id:toou2d_scrollbarv;
    width: 22;

    property Flickable target: parent;

    //0 - 1
    property double yPosition: 0;

    //小方块
    property alias thumb: mgadgetthumb;

    //轨道
    property alias track: mgadgettrack;

    //可变小  ，true 启动状态为 narrowed false 启动状态为 full
    property bool narrowed: true;

    property bool autoHide: false;

    //Too small a height affects drag accuracy
    property int thumbMinHieght: 30;

    property int stateDuration: 1000;

    property Component thumbComponent;

    property Component trackComponent;

    state: narrowed ? "narrowed" : "full";

    TGadgetBackground{
        id:mgadgettrack;
        onWidthChanged:  console.error("Width Invalid setting...");
        onHeightChanged: console.error("Height Invalid setting...");
    }

    Loader{
        id:track;
        anchors.right: parent.right;
        sourceComponent: trackComponent;
        height:  parent.height;
        visible: mgadgettrack.visible;
    }

    Loader{
        id:thumb
        anchors.horizontalCenter: track.horizontalCenter;
        y: 2
        sourceComponent: thumbComponent;
        visible: mgadgetthumb.visible;
        height:  thumbMinHieght;
    }

    //这些可以不用要了
    TGadgetBackground{
        id:mgadgetthumb;
        onWidthChanged:  console.error("Width Invalid setting...");
        onHeightChanged: console.error("Height Invalid setting...");
    }

    MouseArea{
        id:mouseArea
        property bool ishold: false;

        property bool isdrag: false;

        property double offset: 0;

        //anchors.fill: parent;
        width: parent.width;

        height: parent.height;

        hoverEnabled: true;

        onWheel: {
        }

        onPressed: {
            ishold = true;
            if(mouseY > thumb.y && mouseY < thumb.height + thumb.y){
                offset  = mouseY - thumb.y;
                isdrag = true;
            }else{
                mprivate.setValue(mouseY - thumb.height / 2)
            }
        }

        onReleased: {
            ishold = false;
            isdrag = false;
            if(!containsMouse){
                stateTimer.rStart();
            }
        }

        onEntered: {
            toou2d_scrollbarv.state = "full";
            stateTimer.stop();
        }

        onExited: {
            if(!ishold)stateTimer.rStart();
        }

        onMouseYChanged: {
            if(ishold && isdrag){
                mprivate.setValue(mouseY - offset)
            }
        }

        Component.onCompleted: {
            mprivate.checkVisible();
        }

        onIsholdChanged: target.interactive = !ishold;
    }

    onYPositionChanged: {
        if(mouseArea.ishold){//drag interior setting
            target.contentY = (target.contentHeight - target.height) * yPosition;
        }
    }

    Connections {
        target: toou2d_scrollbarv.target.visibleArea
        ignoreUnknownSignals: true;

        onYPositionChanged: {
            var ny = 0, nh = 0;
            var va = toou2d_scrollbarv.target.visibleArea;
            ny = va.yPosition   * toou2d_scrollbarv.height;
            nh = va.heightRatio * toou2d_scrollbarv.height;;

            if (ny > 2)
                thumb.y = ny;
            else
                thumb.y = 2;

            mprivate.setThumbHeight(ny,nh)

            mprivate.restoreVisibleState();
        }

        onHeightRatioChanged: {
            mprivate.checkVisible();

            var nh = 0, ny = 0;
            var va = toou2d_scrollbarv.target.visibleArea;
            nh = va.heightRatio * toou2d_scrollbarv.height;
            ny = va.yPosition   * toou2d_scrollbarv.height;

            mprivate.setThumbHeight(ny,nh)
        }
    }

    TObject{
        id:mprivate;

        function setValue(v){
            if(v < 2){
                thumb.y = 2;
            }else if(v + thumb.height > height - 2){
                thumb.y = height - thumb.height - 2;
            }else{
                thumb.y = v;
            }

            yPosition = thumb.y / (height -  thumb.height);
        }

        function setThumbHeight(ny,nh) {
            if (ny > 2) {
                var t;
                t = Math.ceil(toou2d_scrollbarv.height - 2 - ny);
                if (nh > t)
                    thumb.height = t;
                else
                    thumb.height = nh;
            } else
                thumb.height = nh + ny;
        }

        function checkVisible(){
            var t = toou2d_scrollbarv.target;
            if(t){
                toou2d_scrollbarv.visible = t.contentHeight > t.height;
                toou2d_scrollbarv.enabled = toou2d_scrollbarv.visible;
            }
        }

        function restoreVisibleState(){
            if(!mouseArea.containsMouse && !mouseArea.ishold && !stateTimer.running){
                if(toou2d_scrollbarv.narrowed){
                    toou2d_scrollbarv.state = "narrowed";
                }else{
                    toou2d_scrollbarv.state = "full";
                }
                stateTimer.rStart();
            }
        }
    }


    trackComponent: TRectangle{
        id:mt
        theme.enabled: false;
        state: toou2d_scrollbarv.state;
        color: "#E5E5E5"
        opacity: 0.1
        states: [
            State {
                name: "full"
                PropertyChanges {
                    target: mt
                    color:"#5d5d5d"
                    width: 15;
                }
            },
            State {
                name: "narrowed"
                PropertyChanges {
                    target: mt
                    width:5;
                    visible:false;
                }
            },
            State {
                name: "hide"
                PropertyChanges {
                    target: mt
                    visible:false;
                }
            }
        ]
    }

    thumbComponent: TRectangle{
        id:mth
        theme.enabled: false;
        state: toou2d_scrollbarv.state;
        radius: width / 2;
        color: "#B2B2B2"
        states: [
            State {
                name: "full"
                PropertyChanges {
                    target: mth
                    width:8;
                }
            },
            State {
                name: "narrowed"
                PropertyChanges {
                    target: mth
                    width:3;
                }
            },
            State {
                name: "hide"
                PropertyChanges {
                    target: mth
                    visible:false;
                }
            }
        ]
    }

    Timer{
        id:stateTimer;
        property bool isrun:  narrowed || autoHide
        interval: stateDuration; running: isrun ; repeat : true;
        onTriggered:{
            if(toou2d_scrollbarv.state === "full"){
                if(toou2d_scrollbarv.narrowed){
                    toou2d_scrollbarv.state = "narrowed";
                }
                else if(toou2d_scrollbarv.autoHide){
                    toou2d_scrollbarv.state = "hide";
                }
            }
            else if(toou2d_scrollbarv.state === "narrowed"){
                if(toou2d_scrollbarv.autoHide){
                    toou2d_scrollbarv.state = "hide";
                }
            }

            if(toou2d_scrollbarv.state === "hide"){
                stop();
            }
        }

        function rStart(){
            if(isrun)restart();
        }
    }

}
