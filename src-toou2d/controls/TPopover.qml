import QtQuick 2.6
import Toou2D 1.0

// 定点弹出框
//    与Dialog 不同的时他的小窗是指定位置的。
//    重新实现bodyComponent ，可完成高级扩展，请参考 TPopoverMenu

//    TPopover{

//    }

/*! TODO */
TPopup{
    id:toou2d_popover;

    property int   padding: 2;

    property int   bodyWidth: 150;

    property alias bodyBackground:mbodybg;

    property alias bodyBorder: mbodyBorder;

    property alias theme: mtheme;

    property Component bodyComponent: defaultDodyComponent;

    backgroundComponent:null;

    onTriggeredBackground: close();

    onBodyWidthChanged: resetLayout();

    function open(pos_x,pos_y){
        bodyLoader.show();
        privatec.create();
        bodyLoader.x = pos_x;
        bodyLoader.y = pos_y;

        resetLayout();
        opened();
    }

    function openToGlobal(item , off_x , off_y){
        bodyLoader.show();
        privatec.create();
        var ox = off_x ? off_x + 2 : 0;
        var oy = off_y ? off_y + 2 : 0;
        var p = item.parent.mapToGlobal(item.x + ox , item.y + oy);

        bodyLoader.x = p.x - _root_window_.x;
        bodyLoader.y = p.y - _root_window_.y;

        resetLayout();
        opened();
    }

    function resetLayout(){
        if(bodyLoader.width + bodyLoader.x > _root_window_.width){
            bodyLoader.x = _root_window_.width - bodyLoader.width - 5;
        }
        else if(bodyLoader.x <= 0){
            bodyLoader.x = 5;
        }

        if(bodyLoader.height + bodyLoader.y > _root_window_.height){
            bodyLoader.y = _root_window_.height - bodyLoader.height - 5;
        }else if(bodyLoader.y <= 0){
            bodyLoader.y = 5;
        }
    }

    function close(){
        privatec.close();
        bodyLoader.hide();
        closeed();
    }

    Connections{
        target: _root_window_;
        onWidthChanged:close();
        onHeightChanged:close();
    }

    TGadgetBackground{
        id:mbodybg;
        radius: 2;
        color: "#FCFCFC"
    }

    TGadgetBorder{
        id:mbodyBorder;
        width: 1;
        color: Qt.darker(mbodybg.color,1.2)
    }

    Loader{
        id:bodyLoader;
        MouseArea{
            anchors.fill: parent;
            z:-1
        }

        function show(){
            sourceComponent = bodyComponent;
        }

        function hide(){
            sourceComponent = null;
        }
    }

    Component{
        id:defaultDodyComponent;
        TRectangle{
            width:  bodyWidth  + border.width * 4;
            height: clayout.height + 20;
            color:  mbodybg.color;
            radius: mbodybg.radius
            border.width: mbodyBorder.width;
            border.color: mbodyBorder.color;

            Column{
                id:clayout
                width: parent.width;
                spacing: 10
                anchors.top: parent.top;
                anchors.topMargin: toou2d_popover.padding;

                TRectangle{
                    width: parent.width - 2;
                    anchors.horizontalCenter: parent.horizontalCenter;

                    height: 28
                    TLabel{
                        text: "TPopover测试"
                        font.pixelSize: TPixelSizePreset.PH5
                        anchors.centerIn: parent;
                    }
                }

                TLabel{
                    width: parent.width - 10;
                    text: "重新实现bodyComponent ，可完成高级扩展!请参考 TPopoverMenu";
                    font.pixelSize: TPixelSizePreset.PH6
                    wrapMode: Text.WordWrap
                    anchors.horizontalCenter: parent.horizontalCenter;
                }
            }

            theme.className: toou2d_popover.theme.className;
            theme.groupName: toou2d_popover.theme.groupName;
            theme.state:     toou2d_popover.theme.state;
            theme.childName: "body";
        }
    }

    TThemeBinder{
        id:mtheme
        className: "TPopover";

        property alias padding:   toou2d_popover.padding;
        property alias bodyWidth: toou2d_popover.bodyWidth;

        Component.onCompleted: initialize();
    }
}
