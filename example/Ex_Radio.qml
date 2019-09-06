import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 15;

    Row{
        id:layout
        spacing: 3
        TRadioBoxGroup{
            parent: layout

            TRadioBox{
                label.text: "Guangzhou"

                checked: true
            }

            TRadioBox{
                label.text: "Shanghai"
            }

            TRadioBox{
                enabled: false;
                label.text: "Hong Kong"
            }

            onCurrentItemChanged: result.text =  currentItem.label.text;
        }

        Item{width: 18; height: 10;}

        TLabel{
            id:result
            width: 40;
            anchors.verticalCenter: parent.verticalCenter;
        }
    }

    Row{
        id:layoutborder
        spacing: 25
        anchors.horizontalCenter: parent.horizontalCenter
        TRadioBoxGroup{
            parent: layoutborder

            TRadioBox{
                id:tb
                label.text: "Primary"
                iconPosition: TPosition.Reght
                background.visible: true
                border.width: 1;
                theme.groupName: "rboxa"

                states: [
                    State {
                        name: "checked"
                        PropertyChanges {
                            target: tb.border
                            color:"#409EFF"
                        }
                    }
                ]
            }

            TRadioBox{
                id:tb2
                label.text: "Success"
                iconPosition: TPosition.Reght
                background.visible: true
                border.width: 1;
                background.color: "#F0F9EB"
                theme.groupName: "rboxb"
                states: [
                    State {
                        name: "checked"
                        PropertyChanges {
                            target: tb2.border
                            color:"#67C23A"
                        }
                    }
                ]
            }

            TRadioBox{
                id:tb3
                label.text: "Warning"
                iconPosition: TPosition.Reght
                background.visible: true
                border.width: 1;
                background.color: "#FDF6ED"
                theme.groupName: "rboxc"
                states: [
                    State {
                        name: "checked"
                        PropertyChanges {
                            target: tb3.border
                            color:"#E6A23C"
                        }
                    }
                ]
            }

            TRadioBox{
                id:tb4
                label.text: "Danger"
                iconPosition: TPosition.Reght
                background.visible: true
                border.width: 1;
                background.color: "#FEF0F0"
                theme.groupName: "rboxd"
                states: [
                    State {
                        name: "checked"
                        PropertyChanges {
                            target: tb4.border
                            color:"#F56C6C"
                        }
                    }
                ]
            }
        }
    }

}
