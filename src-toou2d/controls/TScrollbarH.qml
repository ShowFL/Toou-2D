import QtQuick 2.6
import Toou2D  1.0

/* 滚动条-横向
滚动条可配合 Qt ListView ，Qt Flickable 使用。
 TScrllbarH{
    target:listView;
 }

*/
/*! TODO */
TMouseArea{
    id:toou2d_scrollbarh

    property var target: parent;

    property alias hide: _private.hide;

    property alias theme: theme;

    cursorShape: Qt.ArrowCursor;

    hoverEnabled: true;

    height: 18;
    y:      target ? target.height - height : 0;
    width:  target ? target.width : 0;

    Connections{
        target: toou2d_scrollbarh.target
        onContentWidthChanged:toou2d_scrollbarh.visible = target.contentWidth > target.width;
        onWidthChanged:toou2d_scrollbarh.visible = target.contentWidth > target.width;
    }

    onEntered: {
        if(target){
            target.interactive = false;
        }
        block.ishover = true;
        bg.ishover    = true;
    }

    onExited: {
        if(target){
            target.interactive = true;
        }
        if(!_private.isdraging){
            block.ishover = false;
            bg.ishover = false;
        }
    }

    onPressed: {
        if(mouse.x < block.x){
            _private.setFlickableContentX(target.contentX - 200);
        }else if(mouse.x > block.x + block.width){
            _private.setFlickableContentX(target.contentX + 200);
        }else{
            _private.isdraging = true;
            _private.dX = mouse.x;
        }
    }

    onMouseXChanged: {
        if(_private.isdraging){
            var t = ( target.width - target.contentWidth) * (mouseX - _private.dX)/(width - block.width);
            _private.setFlickableContentX(target.contentX - t);
            _private.dX = mouseX;
        }
    }

    onReleased: {
        _private.isdraging = false;
        if(!containsMouse) exited();
    }

    TObject{
        id:_private
        property bool isdraging: false;
        property bool hide: false;
        property double dX: 0;
        function setFlickableContentX(value){
            if(!target)return;
            if(value < 0)
                target.contentX = 0;

            else if(value > target.contentWidth - target.width)
                target.contentX = target.contentWidth - target.width;

            else
                target.contentX = value;
        }
    }

    Rectangle{
        id:bg;
        property bool ishover: false;

        anchors.fill: parent;
        color:   theme.bg_color;
        opacity: theme.bg_opacity;
        visible: ishover;
    }

    Rectangle {
        id: block
        property bool ishover: false;

        y:       ishover ? (parent.height - height) / 2 : parent.height - height;
        x:       target ? target.visibleArea.xPosition * target.width : 0;
        color:   theme.block_color;
        height:  ishover ? 8 : 4;
        width:   target ? target.visibleArea.widthRatio * target.width : 0// ;
        radius:  height / 2
        visible: ishover || !_private.hide
        opacity: ishover ? theme.block_opacity : 0.7;
    }

    TThemeBinder{
        id:theme;
        className: "TScrollbarV";

        state: toou2d_scrollbarh.isdraging ? "draging" : "";

        property color  bg_color:   bindingColor("bg_color","#B5B5B5");
        property double bg_opacity: bindingDouble("bg_opacity",0.1);

        property color  block_color:   bindingColor("block_color","#B5B5B5");
        property double block_opacity: bindingDouble("block_opacity",1);
    }
}
