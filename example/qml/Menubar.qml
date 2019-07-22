import QtQuick 2.0
import Toou2D 1.0

TRectangle {
    signal trigger(string label,string url);

    property bool isopen: false;
    color: "#4f4f4f"
    x:isopen ? 0 : width * -1;

    TRectangle{
        width:1;
        height: parent.height;
        color: Qt.darker(parent.color,1.2)
        anchors.right: parent.right;
    }

    TLabel{
        id:logo
        text: "T2D";
        font.pixelSize: 30;
        font.bold: true;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 28;
        color: "#fff"
    }

    ListView{
        width: parent.width;
        anchors.top:logo.bottom;
        anchors.topMargin: 20;
        anchors.bottom: parent.bottom;
        spacing: 5;
        model: ListModel{
            ListElement {
                label: "Home"
                url: "qrc:/qml/Home.qml"
            }

            ListElement {
                label: "Button"
                url: "qrc:/qml/ButtonDemo.qml"
            }

            ListElement {
                label: "Message"
                url: "qrc:/qml/MessageDemo.qml"
            }

            ListElement{
                label:"AwesomeIcon"
                url:"qrc:/qml/AwesomeIcon.qml"
            }

            ListElement {
                label: "So easy"
                url: "qrc:/qml/SoeasyDemo.qml"
            }

            ListElement {
                label: "FPS monitor"
                url: "qrc:/qml/FpsDemo.qml"
            }

            ListElement {
                label: "Themes"
                url: "qrc:/qml/ThemeListDemo.qml"
            }

            ListElement {
                label: "Website"
                url: "http://2d.toou.net"
            }
        }

        delegate: TMouseArea {
            width: parent.width;
            height: 35;

            Text {
                text: label;
                color: "#fff"
                anchors.centerIn: parent;
            }

            onClicked: {

                if(label === "Website"){
                    Qt.openUrlExternally(url);
                }else{
                    trigger(label,url);
                    isopen = !isopen;
                }
            }
        }
    }


    Behavior on x {
        NumberAnimation {
            duration: 100
        }
    }
}
