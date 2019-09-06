import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 15;

    Row{
        id:layout
        spacing: 10

        TSwitch{

        }

        TLabel{
            anchors.verticalCenter: parent.verticalCenter;
            text: "Pay by Year"
        }

        TSwitch{
            activeBackground.color: "#e4a147"
        }

        TLabel{
            anchors.verticalCenter: parent.verticalCenter;
            text: "Pay by Month"
        }

        TSwitch{
            checked: true
            activeBackground.color: "#76C551"
        }

        TLabel{
            anchors.verticalCenter: parent.verticalCenter;
            text: "Pay by Day"
        }
    }
}
