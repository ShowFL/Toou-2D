import QtQuick 2.0
import Toou2D 1.0
import QtQuick.Layouts 1.3
TRectangle {
    theme.className: "background"

    ListView{
        id:listView;
        clip: true;
        spacing: 0;
        anchors.fill: parent;

        model: ListModel{
            ListElement{
                uname:"Aaron"
                badge:2
                date:"Yesterday"
            }

            ListElement{
                uname:"Michael"
                badge:0
                date:"Thursday"
            }

            ListElement{
                uname:"18620805806"
                badge:3
                date:"Monday"
            }

            ListElement{
                uname:"Douglas"
                badge:0
                date:"Monday"
            }
        }

        delegate: TRectangle{
            width: listView.width;
            height: 65;

            Rectangle{
                anchors{
                    top: parent.top;
                    bottom: parent.bottom;
                    topMargin:  -1;
                    bottomMargin: -1;
                }
                width: parent.width;
                color: Qt.darker(parent.color,1.2)
                z:-1;
            }

            RowLayout{
                anchors.left: parent.left;
                anchors.leftMargin: 25;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 20;

                TLabel{
                    font.pixelSize: 16;
                    text: uname;
                }

                TBadge{
                    value: badge;
                    visible: badge !== 0;
                }
            }


            RowLayout{
                anchors.rightMargin: 20;
                anchors.right: parent.right;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 10;
                TLabel{
                    text: date
                    color: "#9a9a9a"
                }

                TIconButton{
                    iconSource: T2D.FA_phone
                    backgroundItem: null;
                }
            }

            TMouseArea{
                anchors.fill: parent;
                onClicked: dialog.open({"message":"Call:  " + uname});
            }
        }
    }


    TDialog{
        id:dialog
        titleItem: null;
        buttons: "Cancel,OK";
        onButtonClicked: close();
    }
}
