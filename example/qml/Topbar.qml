import QtQuick 2.0
import Toou2D 1.0

TRectangle{
    theme.className: "topbar"

    signal showMenubar();

    property string title: "";

    TRectangle{
        width: parent.width;
        height: 1;
        anchors.bottom: parent.bottom;
        theme.enabled: false;
        color: Qt.darker(parent.color,1.1);
    }

    TIconButton{
        width: height;
        height: parent.height -1;
        anchors.left: parent.left;
        iconSource: T2D.FA_list;
        onClicked: showMenubar();
        theme.className: "topbar"
    }

    TLabel {
        text: title
        anchors.centerIn: parent;
    }

    TIconButton{
        width: height;
        height: parent.height -1;
        anchors.right: parent.right;
        iconSource: T2D.FA_ellipsis_v
        theme.className: "topbar"
        onClicked: {
            choosePopover.open(mouse.x + x,height + y + 5)
        }
    }

    TPopover{
        id:choosePopover;

        width: 120;

        TPopoverElement{
            label:"default";
            icon:TThemeManager.globalTheme === "default" ? T2D.FA_check_square_o : T2D.FA_square_o;
        }

        TPopoverElement{
            label:"dark";
            icon:TThemeManager.globalTheme === "dark" ? T2D.FA_check_square_o : T2D.FA_square_o;
        }

        onClicked: {
            TThemeManager.globalTheme = element.label;
        }
    }
}
