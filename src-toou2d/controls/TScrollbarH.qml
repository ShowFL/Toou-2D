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
    height: 22;

    property Flickable target: parent;

    //0 - 1
    property double xPosition: 0;

    //小方块
    property alias thumb: mgadgetthumb;

    //轨道
    property alias track: mgadgettrack;

    //可变小  ，true 启动状态为 narrowed false 启动状态为 full
    property bool narrowed: true;

    property bool autoHide: false;

    //Too small a height affects drag accuracy
    property int thumbMinWidth: 30;

    property Component thumbComponent;

    property Component trackComponent;

    property int stateDuration: 1000;

    state: narrowed ? "narrowed" : "full";

    TGadgetBackground{
        id:mgadgettrack;
        onWidthChanged:  console.error("Width Invalid setting...");
        onHeightChanged: console.error("Height Invalid setting...");
    }

    Loader{
        id:track;
        anchors.bottom: parent.bottom;
        sourceComponent: trackComponent;
        width:  parent.width;
        visible: mgadgettrack.visible;
    }

    Loader{
        id:thumb
        anchors.verticalCenter: track.verticalCenter;
        sourceComponent: thumbComponent;
        visible: mgadgetthumb.visible;
        width:   thumbMinWidth;
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

        anchors.fill: parent;

        hoverEnabled: true;

        onWheel: {
        }

        onPressed: {
            ishold = true;
            if(mouseX > thumb.x && mouseX < thumb.width + thumb.x){
                offset  = mouseX - thumb.x;
                isdrag = true;
            }else{
                mprivate.setValue(mouseX - thumb.width / 2)
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

        onMouseXChanged: {
            if(ishold && isdrag){
                mprivate.setValue(mouseX - offset)
            }
        }

        Component.onCompleted: {
            mprivate.checkVisible();
        }

        onIsholdChanged: target.interactive = !ishold;
    }

    onXPositionChanged: {
        if(mouseArea.ishold){//drag interior setting
            target.contentX = (target.contentWidth - target.width) * xPosition;
        }
    }

    Connections{
        target: toou2d_scrollbarv.target;
        onContentXChanged:{
            if(!mouseArea.ishold){
                var t = toou2d_scrollbarv.target;
                var p = t.contentX / (t.contentWidth - t.width);
                mprivate.setValue(p * (width - thumb.width))
            }

            mprivate.restoreVisibleState();
        }

        onContentWidthChanged:{
            var t  = toou2d_scrollbarv.target;
            var nh = t.width / t.contentWidth * toou2d_scrollbarv.width;
            if(nh > thumbMinWidth){
                thumb.width = nh;
            }

            mprivate.checkVisible();
        }

        onWidthChanged:mprivate.checkVisible();
    }

    TObject{
        id:mprivate;

        function setValue(v){
            if(v < 0){
                thumb.x = 0;
            }else if(v + thumb.width > width){
                thumb.x = width - thumb.width;
            }else{
                thumb.x = v;
            }

            xPosition = thumb.x / (width -  thumb.width);
        }

        function checkVisible(){
            var t = toou2d_scrollbarv.target;
            if(t){
                toou2d_scrollbarv.visible = t.contentWidth > t.width;
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
        state: toou2d_scrollbarv.state;
        color: "#E5E5E5"
        opacity: 0.1
        states: [
            State {
                name: "full"
                PropertyChanges {
                    target: mt
                    color:"#5d5d5d"
                    height: 15;
                }
            },
            State {
                name: "narrowed"
                PropertyChanges {
                    target: mt
                    height:5;
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

    thumbComponent: Rectangle{
        id:mth
        state: toou2d_scrollbarv.state;
        radius: width / 2;
        color: "#B2B2B2"
        states: [
            State {
                name: "full"
                PropertyChanges {
                    target: mth
                    height:8;
                }
            },
            State {
                name: "narrowed"
                PropertyChanges {
                    target: mth
                    height:3;
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
