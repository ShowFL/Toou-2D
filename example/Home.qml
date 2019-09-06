import QtQuick 2.6
import Toou2D 1.0

Item {

    Column{
        spacing: 30
        anchors.centerIn: parent;
        TLabel{
            text: "Hello Toou2D";
            font.pixelSize: 30;
            font.bold: true;
            anchors.horizontalCenter: parent.horizontalCenter;
        }

        TButton{
            width: 150;
            label.text: "Show time"
            anchors.horizontalCenter: parent.horizontalCenter;
            onClicked: begin();
        }
    }

}
