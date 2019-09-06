import QtQuick 2.6
import Toou2D 1.0

Column{
    id:layout
    spacing: 15;

    property int index: 0;

    property int count: 6;

    TPagination{
        theme.groupName: "first"
        anchors.horizontalCenter: parent.horizontalCenter
        count: parent.count
        currentIndex: layout.index;
        onTriggered: parent.index = index;
    }


    TPagination{
        theme.groupName: "second"
        anchors.horizontalCenter: parent.horizontalCenter
        count: parent.count
        currentIndex: layout.index;
        itemBackground.width:  10;
        itemBackground.height: 10;
        itemBackground.radius: 5;
        itemActiveBg.width: 10;
        itemActiveBg.height: 10;
        itemActiveBg.radius: 5;
        itemActiveBg.color: "#46A0FC"
        onTriggered:  parent.index = index;
    }


    TPagination{
        id:pagination
        theme.groupName: "third"
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 15
        count: parent.count
        currentIndex: layout.index;
        onTriggered:  layout.index = index;


        itemBackground.width: 25;
        itemBackground.height: 25;

        itemBackground.color: "#FDFDFD"
        itemActiveBg.color:"#F56C6C"

        contentComponent: TButton{
            id:customItem;
            property bool active: layout.index === index ;
            label.text: index + 1

            width:  pagination.itemBackground.width;
            height: pagination.itemBackground.height;
            background.radius: pagination.itemActiveBg.radius;
            theme.enabled: false;

            border.width: 1;
            border.color: {
                TThemeManager.appThemeInvalid;
                return active ? pagination.itemActiveBorder.color : pagination.itemBorder.color;
            }

            background.color: {
                TThemeManager.appThemeInvalid;
                return active ? pagination.itemActiveBg.color : pagination.itemBackground.color;
            }
            label.color: {
                TThemeManager.appThemeInvalid;
                return active ? "#FFF" : "#5d5d5d";
            }
            label.font.bold: active
            onClicked: layout.index = index;
        }
    }

}
