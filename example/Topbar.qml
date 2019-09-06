import QtQuick 2.6
import Toou2D 1.0

TRectangle{
    signal showMenu();
    color: "#F8F8F8"
    property string title: "Home";
    theme.groupName: "topbar"

    TIconButton{
        width: height;
        height: parent.height -1;
        anchors.left: parent.left;
        icon.source: TAwesomeType.FA_list;
        icon.position: TPosition.Only;
        backgroundComponent: null;
        theme.groupName: "topbarbtn"
        onClicked: showMenu();
    }

    TLabel {
        text: title
        anchors.centerIn: parent;
        font.pixelSize: TPixelSizePreset.PH4
        font.bold: true
    }

    TIconButton{
        id:btn
        width: height;
        height: parent.height -1;
        anchors.right: parent.right;
        icon.source: TAwesomeType.FA_ellipsis_v
        icon.position: TPosition.Only;
        backgroundComponent: null;
        theme.groupName: "topbarbtn"
        onClicked: themeMenu.openToGlobal(btn,0,btn.height + 5)
    }

    TDividerLine{
        width: parent.width;
        height: 1;
        anchors.bottom: parent.bottom;
        theme.groupName: "topbar"
    }

    TPopoverMenu{
        id:themeMenu;
        bodyWidth: 120;

        TPopoverElement{
            type:"group"
            text: "Choose theme"
        }

        TPopoverElement{
            text: "None"
            otherData: "";
            iconSource: TThemeManager.appThemeInvalid ? TAwesomeType.FA_check_circle_o : TAwesomeType.FA_circle_o
        }

        Component.onCompleted: {
            var list = TThemeManager.themeList;
            for(var i in list){
                var obj = elementComponent.createObject(themeMenu);
                obj.otherData = list[i].name;
                obj.text = list[i].name;
                addElement(obj)
            }
        }

        Component{
            id:elementComponent
            TPopoverElement{
                iconSource:  TThemeManager.appTheme === otherData ? TAwesomeType.FA_check_circle_o : TAwesomeType.FA_circle_o
            }
        }

        onTriggered: TThemeManager.appTheme = modelData.otherData;
    }



}
