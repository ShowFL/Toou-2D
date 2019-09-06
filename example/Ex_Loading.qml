import QtQuick 2.0
import Toou2D 1.0

Item{
    width: 350;
    height: 180;
    TLabel{
        wrapMode :Text.WordWrap;
        anchors.fill: parent;
        text:"With Toou2D becoming more popular every day, there is the constant need to be different. There are millions of users. If Toou2D layouts are chosen well, then you can enhance your profile a great deal.\n
        With Toou2D becoming more popular every day, there is the constant need to be different. There are millions of users. If Toou2D layouts are chosen well, then you can enhance your profile a great deal."
    }

    TRectangle{
        anchors.fill: parent;
        opacity: 0.9
    }

    TBusyIndicator{
        id:tbi
        anchors.centerIn: parent;
    }

    Row{
        spacing: 50;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        TButton{
            theme.groupName: "demo-popdialog"
            backgroundComponent: null;
            label.text: "Change in circles"
            onClicked: tbi.contentComponent = tbi.defaultDotAnimator;
        }

        TButton{
           theme.groupName: "demo-popdialog"
            backgroundComponent: null;
            label.text: "Change in dot"
            onClicked: tbi.contentComponent = tbi.defaultIconAnimator;
        }
    }


}
