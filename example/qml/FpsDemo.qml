import QtQuick 2.0
import Toou2D 1.0

TRectangle {
    id:screen
    theme.className: "background"

    TRectangle{
        theme.enabled: false;
        color: "#fff"
        width: Math.max(img.width,img.height) + 50;
        height: Math.max(img.width,img.height) + 50;
        radius: width/2;
        anchors.centerIn: parent;

        Image {
            id: img
            source: "qrc:/res/toou_logo.jpg"
            anchors.centerIn: parent;

        }

        NumberAnimation on rotation {
            from:0
            to: 360
            duration: 800
            loops: Animation.Infinite
        }

    }

    TFpsMonitor{
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 20;
    }


}
