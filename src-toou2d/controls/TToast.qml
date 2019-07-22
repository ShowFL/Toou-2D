pragma Singleton
import QtQuick 2.6
import QtQuick.Layouts 1.3
import Toou2D 1.0

QtObject {
    id:toast

    property int buttons: 0;
    property int longTime: 5 * 1000;
    property int shortTime: 2 * 1000;

    function showMessage(mes,duration){
        _private.show(TToastItem.Message,mes,duration);
    }


    function showError(mes,duration){
        _private.show(TToastItem.Error,mes,duration);
    }

    function showWarning(mes,duration){
        _private.show(TToastItem.Warning,mes,duration);
    }

    function showCustom(mes,duration){
        _private.show(TToastItem.Custom,mes,duration);
    }

    property QtObject _private: QtObject{
        property var root_window: _root_window_;
        property var curlayout: null;

        function initLayout(){
            if(curlayout == null){
                curlayout = layoutComponent.createObject(root_window);
                curlayout.y = 20;
                curlayout.z = 2;
            }
        }

        function show(type , message , duration){
            initLayout();

            var loastToastLoader = curlayout.getLastToastLoader();
            if(
                    loastToastLoader !== null &&
                    loastToastLoader.loader.item &&
                    loastToastLoader.loader.item.message === message &&
                    loastToastLoader.loader.item.type === type){
                return;
            }

            var toast = _private.itemComponent.createObject(_private.curlayout);

            switch(type){
            case TToastItem.Message:
                toast.loader.sourceComponent = contentMessageItem;
                break;
            case TToastItem.Error:
                toast.loader.sourceComponent = contentErrorItem;
                break;
            case TToastItem.Warning:
                toast.loader.sourceComponent = contentWarningItem;
                break;
            case TToastItem.Custom:
                toast.loader.sourceComponent = contentCustomItem;
                break;
            }

            toast.loader.item.type = TToastItem.Message;
            toast.loader.item.message = message;
            toast.loader.scale = 1;
            if(duration)
                toast.duration = duration;
        }

        property Component itemComponent: Item{
            id:contentItem;
            property int duration: 3 * 1000;

            width: parent.width;
            height: loader.height;
            property alias loader: loader;

            Timer {
                interval: duration; running: true; repeat: true
                onTriggered: {
                    contentItem.destroy();
                }
            }

            Loader{
                id:loader;
                x:(parent.width - width) / 2;
                scale: 0;
                Behavior on scale {
                    NumberAnimation {
                        easing.type: Easing.OutBack;
                        duration: 100
                    }
                }
            }
        }

        property Component layoutComponent: Component{
            Column{
                spacing: 20;
                width: parent.width;
                move: Transition {
                    NumberAnimation { properties: "y"; easing.type: Easing.OutBack; duration: 300 }
                }

                function getLastToastLoader(){
                    if(children.length > 0){
                        return children[children.length - 1];
                    }
                    return null;
                }
            }
        }
    }

    property Component contentMessageItem: TToastItem{
        id:item;
        width: layout.width;
        height: layout.height;

        TRectangle{
            width: layout.width + 10;
            height: layout.height + 10;
            radius: height/2
            color: "#33D6BD"
            anchors.centerIn: layout;
            theme.enabled: false;
            border.width: 1;
            border.color: Qt.darker(color,1.1);
        }

        Row{
            id:layout;
            spacing: 15;
            TRectangle{
                width: 50 - 10;
                height: 50 - 10;
                radius: 20
                color: "#fff"
                theme.enabled: false;
                Text {
                    text: qsTr("M")
                    anchors.centerIn: parent;
                    font.pixelSize: 15;
                    font.bold: true;
                }
            }

            Item{
                id:textitem;
                width: label.contentWidth + 15;
                height: 40;
                Text {
                    id: label
                    text: item.message;
                    anchors.verticalCenter: textitem.verticalCenter;
                    color: "#fff"
                    font.pixelSize: 18;
                }
            }
        }
    }

    property Component contentErrorItem: TToastItem{
        id:item;
        width: layout.width;
        height: layout.height;

        TRectangle{
            width: layout.width + 10;
            height: layout.height + 10;
            radius: height/2
            color: "#F76CAA"
            anchors.centerIn: layout;
            border.width: 1;
            border.color: Qt.darker(color,1.1);
            theme.enabled: false;
        }

        Row{
            id:layout;
            spacing: 15;
            TRectangle{
                width: 50 - 10;
                height: 50 - 10;
                radius: 20
                color: "#fff"
                theme.enabled: false;
                Text {
                    text: qsTr("E")
                    anchors.centerIn: parent;
                    font.pixelSize: 15;
                    font.bold: true;
                }
            }

            Item{
                id:textitem;
                width: label.contentWidth + 15;
                height: 40;
                Text {
                    id: label
                    text: item.message;
                    anchors.verticalCenter: textitem.verticalCenter;
                    color: "#fff"
                    font.pixelSize: 18;
                }
            }
        }

    }

    property Component contentWarningItem: TToastItem{
        id:item;
        width: layout.width;
        height: layout.height;

        TRectangle{
            width: layout.width + 10;
            height: layout.height + 10;
            radius: height/2
            color: "#FEC34F"
            anchors.centerIn: layout;
            theme.enabled: false;
        }

        Row{
            id:layout;
            spacing: 15;
            TRectangle{
                width: 50 - 10;
                height: 50 - 10;
                radius: 20
                color: "#fff"
                theme.enabled: false;
                Text {
                    text: qsTr("W")
                    anchors.centerIn: parent;
                    font.pixelSize: 15;
                    font.bold: true;
                }
            }

            Item{
                id:textitem;
                width: label.contentWidth + 15;
                height: 40;
                Text {
                    id: label
                    text: item.message;
                    anchors.verticalCenter: textitem.verticalCenter;
                    color: "#fff"
                    font.pixelSize: 18;
                }
            }
        }
    }

    property Component contentCustomItem: TToastItem{
        width: 100;
        height: 30;
        TLabel{
            anchors.centerIn: parent;
            theme.enabled: false;
            text: "Custom toast <" + parent.message + ">";
        }
    }

}
