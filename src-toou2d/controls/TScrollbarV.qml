import QtQuick 2.6
import Toou2D  1.0

/* 滚动条-竖向
滚动条可配合 Qt ListView ，Qt Flickable 使用。
 TScrllbarV{
    target:listView;
 }

*/
/*! TODO */
TMouseArea{
    id:toou2d_scrollbarv;

    property var target: parent;

    property alias hide: _private.hide;

    property alias theme: theme;

    cursorShape: Qt.ArrowCursor;

    hoverEnabled: true;

    x:      target ? target.width - width : 0;
    height: target ? target.height : 0;
    width:  18;

    Connections{
        target: toou2d_scrollbarv.target
        onContentHeightChanged:toou2d_scrollbarv.visible = target.contentHeight > target.height;
        onHeightChanged:toou2d_scrollbarv.visible = target.contentHeight > target.height;
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
        if(mouse.y < block.y){
            _private.setFlickableContentY(target.contentY - 200);
        }else if(mouse.y > block.y + block.height){
            _private.setFlickableContentY(target.contentY + 200);
        }else{
            _private.isdraging = true;
            _private.dY = mouse.y;
        }
    }

    onMouseYChanged: {
        if(_private.isdraging){
            var t = ( target.height - target.contentHeight) * (mouseY - _private.dY)/(height - block.height);
            _private.setFlickableContentY(target.contentY - t);
            _private.dY = mouseY;
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
        property double dY: 0;
        function setFlickableContentY(value){
            if(!target)return;
            if(value < 0){
                target.contentY = 0;
            }

            else if(value > target.contentHeight - target.height){
                target.contentY = target.contentHeight - target.height;
            }

            else{
                target.contentY = value;
            }
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

        x:       ishover ? (parent.width - width) / 2 : parent.width - width;
        y:       target  ? target.visibleArea.yPosition * target.height : 0;
        color:   theme.block_color;
        width:   ishover ? 8 : 4;
        height:  target ? target.visibleArea.heightRatio * target.height : 0;
        radius:  width / 2
        visible: ishover || !_private.hide
        opacity: ishover ? theme.block_opacity : 0.7;
    }

    TThemeBinder{
        id:theme;
        className: "TScrollbarV";

        state: toou2d_scrollbarv.isdraging ? "draging" : "";

        property color  bg_color:   bindingColor("bg_color","#B5B5B5");
        property double bg_opacity: bindingDouble("bg_opacity",0.1);

        property color  block_color:   bindingColor("block_color","#B5B5B5");
        property double block_opacity: bindingDouble("block_opacity",1);
    }
}
