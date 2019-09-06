import QtQuick 2.6
import Toou2D 1.0


// 对话框
//    在保留当前页面状态的情况下，告知用户并承载相关操作。
//    TDialog{

//    }
/*! TODO */
TObject {
    id:toou2d_dialog
    signal opened();
    signal closed();

    property bool modalclose: true

    property Component bodyComponent;

    function open(){
        _private.create();
    }

    function hideAndClose(){
        _private.hideAndClose();
    }

    function close(){
        _private.close();
    }

    TObject{
        id:_private;
        property var popupbg;

        function create(){
            popupbg = fullpopupbg.createObject(_root_window_);
            popupbg.open();
            popupbg.show = true;
        }

        function hideAndClose(){
            if(popupbg){
                popupbg.show = false;
                popupbg.hide(true);
            }
        }

        function close(){
            if(popupbg) popupbg.close();
        }

        Component{
            id:fullpopupbg

            TPopup{
                property bool show: false;

                Item{
                    id:cbodyComponent
                    property double oy: show ? 0 : -80;
                    width:  windowLoader.width;
                    height: windowLoader.height;
                    anchors.centerIn: parent;
                    anchors.verticalCenterOffset: oy;
                    scale:  show ? 1 : 0;
                    opacity:show ? 1 : 0;

                    Behavior on scale {
                        NumberAnimation {
                            easing.type: Easing.OutBack
                            duration: 300;
                        }
                    }

                    Behavior on oy {
                        NumberAnimation {
                            easing.type: Easing.OutBack
                            duration: 500;
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: 100;
                        }
                    }

                    MouseArea{
                        anchors.fill: parent;
                    }

                    Loader{
                        id:windowLoader;
                        sourceComponent: bodyComponent;
                    }
                }

                onTriggeredBackground: {
                    if(modalclose){
                        show = false;
                        hide(true);
                        closed();
                    }
                }
            }
        }
    }

    bodyComponent: TRectangle{
        theme.parent: mtheme;
        width:  240;
        height: c.height + 20;
        border.width: 1;
        border.color: "#DCDCDC"
        color: "#FFF"
        radius: 4

        Column{
            id:c
            width: parent.width - 10;
            anchors.centerIn: parent;
            TLabel{
                text: "Dialog 基础控件";
                theme.parent: mtheme
            }

            TLabel{
                width: parent.width - 10
                wrapMode: Text.WordWrap
                theme.parent: mtheme
                text: "重新定义bodyComponent，可实现更高级的扩展。请参考TDialog\n点击模态背景可关闭。"
            }
        }
    }

    TThemeBinder{
        id:mtheme;
        className: "TDialogBasic";

        Component.onCompleted: initialize();
    }
}
