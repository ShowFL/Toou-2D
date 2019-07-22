import QtQuick 2.0
import Toou2D 1.0
import QtQuick.Controls 2.2
TRectangle {
    theme.className: "background"
    Row{
        anchors.top: parent.top;
        anchors.topMargin: 40;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 40;

        Column{
            spacing: 20;
            TButton{
                width: 120
                text:"Toast Message"
                onClicked: TToast.showMessage("这是一个Toast message",TToast.longTime);
            }

            TButton{
                width: 120
                text:"Toast Warning"
                onClicked: TToast.showWarning("这是一个Toast warning",TToast.longTime);
            }

            TButton{
                width: 120
                text:"Toast Error"
                onClicked: TToast.showError("这是一个Toast error",TToast.longTime);
            }

            TButton{
                width: 120
                text:"Toast custom"
                onClicked: {
                    TToast.contentCustomItem = costomToastComponent;
                    TToast.showCustom("Hello Toou2D",TToast.shortTime);
                }
            }

            Component{
                id:costomToastComponent;
                TToastItem{
                    id:tc;
                    width: 130;
                    height: 40;
                    Rectangle{
                        radius: 10;
                        anchors.fill: parent;
                        color: "#8e8e8e"
                        TLabel {
                            anchors.centerIn: parent;
                            text: tc.message;
                        }
                    }
                }
            }
        }


        Column{
            spacing: 20
            TButton{
                width: 120
                text:"Dialog Message"
                onClicked: {
                    dialog.buttons = "OK";
                    dialog.open({"title":"Message","message":"Hello Toou2D"});
                }
            }

            TButton{
                width: 120
                text:"Dialog custom A"
                onClicked:{
                    dialog.buttons = "OK";
                    dialog.customContentItem = listDialogContentItem;
                    dialog.openCustom({"title":"ListView dialog","model":100});
                }
            }

            TButton{
                width: 120
                text:"Dialog custom B"
                onClicked: {
                    dialog.buttons = "Cancel,OK";
                    dialog.customContentItem = inputDialogContentItem;
                    dialog.openCustom({"title":"Please enter user name"});
                }
            }

            TButton{
                width: 120
                text:"Dialog image"
                onClicked: customBrandnewDialog.openCustom({"cimg":"qrc:/res/imgdialog.png"});
            }
        }
    }


    TDialog{
        id:dialog
        onButtonClicked: {
            console.log("click button:" , button.text);
            close();
        }
    }


    Component{
        id:listDialogContentItem
        TDialogItem{
            id:contentItem
            width: 300;
            height: 400;
            ListView{
                spacing: 5;
                anchors.fill: contentItem;
                model: contentItem.parameter.model;
                delegate: Text {
                    text: "Item " + modelData;
                }
            }
        }
    }

    Component{
        id:inputDialogContentItem
        TDialogItem{
            id:contentItem
            width: 230;
            height: 45;

            Rectangle{
                width: 220;
                height: 35;
                border.width: 1;
                border.color: ti.focus ? "#00f" : "#5d5d5d"
                anchors.centerIn: contentItem;
                TextInput{
                    id:ti
                    width: parent.width-10;
                    verticalAlignment: TextInput.AlignVCenter;
                    anchors.centerIn: parent;
                    focus: true;
                }
            }
        }
    }


    TDialog{
        id:customBrandnewDialog

        backgroundItem: null;
        titleItem:      null;
        bottomItem:     null;

        customContentItem:TDialogItem{
            id:content
            width: bgimg.width;
            height: bgimg.height;
            Image {
                id: bgimg
                smooth:false;
                source: content.parameter.cimg;
            }

            TIconButton{
                id:button
                anchors.top: content.top;
                anchors.right: content.right;
                onClicked: customBrandnewDialog.buttonClicked(button,content.parameter);
                backgroundItem: null;
                iconSource: T2D.FA_close;
                iconColor: "#fff"
            }
        }

        onButtonClicked: {
            close();
        }
    }
}
