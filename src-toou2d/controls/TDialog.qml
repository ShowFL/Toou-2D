import QtQuick 2.6
import Toou2D 1.0
import QtGraphicalEffects 1.0
QtObject {
    id:dialog
    signal opened();
    signal closed();

    signal buttonClicked(var button,var parameter);

    property string buttons: "OK";

    function isopening(){
        return _private.fullLayout !== null;
    }

    /*! This property holds the button tooltip. */
    function open(parameter){
        _private.createFullLayout();
        _private.createPopup();
        _private.createDialog(parameter,false);
        opened();
    }

    function openCustom(parameter){
        _private.createFullLayout();
        _private.createPopup();
        _private.createDialog(parameter,true);
        opened();
    }

    function close(){
        if(isopening()){
            _private.fullLayout.focus = true;
            _private.fullLayout.destroy();
        }

        closed();
    }

    property QtObject _private: QtObject{

        property Item fullLayout: null;

        function createFullLayout(){
            fullLayout = fullLayoutComponent.createObject(_root_window_);
        }

        function createPopup(){
            var popup = popbgComponent.createObject(fullLayout);
            popup.opacity = 0.4;
        }

        function createDialog(parameter,custom){
            var dialog = dialogComponent.createObject(fullLayout,{parameter:parameter,customContent:custom});
            dialog.x = Qt.binding(function(){return (fullLayout.width - dialog.width) / 2});
            dialog.y = Qt.binding(function(){return (fullLayout.height - dialog.height) / 2});
            dialog.show();
        }

        property Component fullLayoutComponent: Item{
            anchors.fill: parent;
            MouseArea{
                anchors.fill: parent;
            }
        }

        property Component popbgComponent:  TRectangle{
            anchors.fill: parent;
            color: "#000"
            opacity: 0

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                }
            }
        }

        property Component dialogComponent: Item{
            opacity:0;
            scale: 0
            width: con.width + 10;
            height: con.height + 10;
            property var parameter;
            property bool customContent;

            //            RectangularGlow {
            //                id: effect
            //                anchors.fill: bgloader
            //                glowRadius: 10
            //                spread: 0
            //                color: "#5d5d5d"
            //                cornerRadius: 10
            //            }

            Loader{
                id:bgloader;
                sourceComponent: backgroundItem;
                anchors.fill: parent;
                MouseArea{
                    anchors.fill: parent;
                }
            }

            Column{
                id:con
                anchors.centerIn: parent;
                Loader{
                    id:titleLoader;
                    sourceComponent: titleItem;
                    z:1;
                    onWidthChanged:{
                        if(width>con.width)con.width = width;
                    }
                    onItemChanged: {
                        if(item)item.parameter = parameter;
                    }
                }

                Loader{
                    id:contentLoader;
                    sourceComponent: customContent ? customContentItem : contentItem;
                    onWidthChanged: {
                        if(width>con.width)con.width = width;
                    }
                    onItemChanged: {
                        if(item){
                            item.parameter = parameter;
                            if(item.width < 230){
                                item.width = 230;
                            }
                            if(item.height < 30){
                                item.height = 30;
                            }
                        }
                    }
                }

                Loader{
                    id:bottomLoader;
                    sourceComponent: bottomItem;
                    z:1
                    onWidthChanged: {
                        if(width>con.width)con.width = width;
                    }
                    onItemChanged: {
                        if(item)item.parameter = parameter;
                    }


                }
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 100
                }
            }

            Behavior on scale {
                NumberAnimation {
                    easing.type: Easing.OutBack;
                    duration: 100
                }
            }

            function show(){
                titleLoader.width = contentLoader.width = bottomLoader.width = con.width;
                opacity = 1;
                scale = 1;
            }

        }
    }

    property Component backgroundItem: TRectangle{
        color: "#fff"
        radius: 2;
        theme.enabled: false;
    }

    property Component titleItem: TRectangle{
        id:titleitem;
        property var parameter;
        height: 30;
        color: "#fff"
        theme.enabled: false;

        Rectangle{
            anchors.bottom: titleitem.bottom;
            width: parent.width;
            height: 1;
            color: "#efefef"
        }

        Text {
            text: parameter.title;
            anchors.centerIn: parent;
        }
    }

    property Component contentItem: TRectangle{
        property var parameter;
        width: text.contentWidth + 100;
        height: text.contentHeight + 40;
        theme.enabled: false;

        Text {
            id:text
            text: parameter.message;
            anchors.centerIn: parent;
            font.pixelSize: 20;
        }
    }

    property Component bottomItem: TRectangle{
        id:btngroup;
        property var parameter;
        width: layout.width;
        height: layout.children.length === 0 ? 0 : layout.height + 20;
        theme.enabled: false;

        Row{
            id:layout
            spacing: 10;
            anchors.centerIn: btngroup;
        }

        Component.onCompleted: {
            if(buttons){
                var list = buttons.split(",");
                for(var i = 0 ; i < list.length;i++){
                    var btn = _btn.createObject(layout,{text:list[i]});
                }
            }
        }

        Component{
            id:_btn;
            TButton{
                id:btn
                theme.className: "tdialog"
                width: 90;
                onClicked: dialog.buttonClicked(btn,btngroup.parameter);
                font.pixelSize: 15;
            }
        }
    }

    property Component customContentItem: TRectangle{
        property var parameter;
        width: text2.contentWidth + 100;
        height: text2.contentHeight + 40;
        theme.enabled: false;

        Text {
            id:text2
            text: parameter.message;
            anchors.centerIn: parent;
            font.pixelSize: 20;
        }
    }

}
