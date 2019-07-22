import QtQuick 2.0
import Toou2D 1.0

TRectangle {
    theme.className: "background"

    signal begin();

    TLabel{
        text: "Hello Toou2D";
        theme.className: "home-label"
        anchors.centerIn: parent;
        anchors.verticalCenterOffset: -60;
        font.pixelSize: 30;
        font.bold: true;
    }

    TButton{
        theme.className: "home-begin";
        anchors.centerIn: parent;
        anchors.verticalCenterOffset: 30;
        width: parent.width / 3;
        height: 40;
        text: "Show time"//"Begin"
        onClicked: begin();
    }

}
