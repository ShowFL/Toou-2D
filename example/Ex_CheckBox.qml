import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 8;

    Row{
        id:layout
        spacing: 5

        TCheckBox{
            label.text: "Movie"
        }

        TCheckBox{
            label.text: "Music"
            checked: true;
        }

        TCheckBox{
            label.text: "Running"
        }

        TCheckBox{
            label.text: "Fitness"
            checked: true;
        }

        TCheckBox{
            label.text: "Sleeps"
            checked: true;
            enabled: false;
        }

    }


    Row{
        spacing: 15

        anchors.horizontalCenter: parent.horizontalCenter
        TCheckBox{
            id:cb
            label.text: "C++"
            checked: Math.random() > 0.5;
            iconPosition: TPosition.Reght
            background.visible: true
            border.width: 1;
            background.color: "#F0F9EB"
            theme.groupName: "cboxa"
            states: [
                State {
                    name: "checked"
                    PropertyChanges {
                        target: cb.border
                        color:"#67C23A"
                    }
                }
            ]
        }

        TCheckBox{
            id:cb2
            label.text: "Lua"
            checked: Math.random() > 0.5;
            iconPosition: TPosition.Reght
            background.visible: true
            border.width: 1;
            background.color: "#F0F9EB"
            theme.groupName: "cboxb"
            states: [
                State {
                    name: "checked"
                    PropertyChanges {
                        target: cb2.border
                        color:"#67C23A"
                    }
                }
            ]
        }

        TCheckBox{
            id:cb3
            label.text: "QML"
            checked: Math.random() > 0.5;
            iconPosition: TPosition.Reght
            background.visible: true
            border.width: 1;
            background.color: "#FDF6ED"
            theme.groupName: "cboxc"
            states: [
                State {
                    name: "checked"
                    PropertyChanges {
                        target: cb3.border
                        color:"#E6A23C"
                    }
                }
            ]
        }

        TCheckBox{
            id:cb0
            label.text: "JAVA"
            checked: Math.random() > 0.5;
            iconPosition: TPosition.Reght
            background.visible: true
            border.width: 1;
            background.color: "#FDF6ED"
            theme.groupName: "cboxd"
            states: [
                State {
                    name: "checked"
                    PropertyChanges {
                        target: cb0.border
                        color:"#E6A23C"
                    }
                }
            ]
        }




    }

}
