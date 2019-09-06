import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 10;
    Item{
        width: 10;
        height: 10;
    }
    Item{
        id:simulation
        width: 270;
        height: content.height;

        anchors.horizontalCenter: parent.horizontalCenter;

        TRectangle{
            id:content
            anchors.fill: parent;
            theme.parent: mtheme;
            height: layout.height

            Column{
                spacing: 2;
                id:layout
                Item{
                    width: 260;
                    height: label.height < 30 ? 30 : label.height;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    TLabel{
                        id:label
                        text: "Hi Toou2D"
                        anchors.horizontalCenter: parent.horizontalCenter;
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true;
                        font.pixelSize: TPixelSizePreset.PH5

                        theme.parent: mtheme
                        theme.childName: "titlabel"
                    }

                    TIconButton{
                        padding: 10
                        backgroundComponent: null;
                        visible: true;
                        icon.type: TIconType.SVG
                        icon.source: "qrc:/net.toou.2d/resource/svg/close-px.svg";
                        icon.position: TPosition.Only;
                        anchors.right: parent.right;
                        anchors.rightMargin: 5;
                        anchors.verticalCenter: parent.verticalCenter;

                        theme.parent: mtheme
                        theme.childName: "closebtn"
                    }
                }

                Item{
                    width: tlabel.width;
                    height: 55;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    TLabel{
                        id:tlabel;
                        anchors.centerIn: parent;
                        text: "This is a text message";
                        theme.parent: mtheme;
                        theme.childName: "content.label"
                    }
                }

                TDividerLine{
                    width: parent.width * 0.95
                    height: 1
                    anchors.horizontalCenter: parent.horizontalCenter;
                    theme.parent: mtheme;
                    theme.childName: "line"
                }

                Item{
                    width: 100;
                    height: 45;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    TButton{
                        backgroundComponent: null;
                        anchors.centerIn: parent;
                        label.font.bold: true;
                        label.text: "Agree"
                        label.color: "#409EFF"
                        theme.state: "btnlighter"
                        theme.className: "TDialog"
                        theme.childName: "btn"
                    }
                }

            }



            border.width: 1;
            border.color: "#DCDCDC"
            color: "#FFF"
            radius: 4
        }

        TThemeBinder{
            id:mtheme;
            className: "TDialog"
        }
    }


    Row{
        TButton{
            label.text: "Open default"
            label.color: "#46A0FC"
            theme.groupName: "demo-popdialog"
            backgroundComponent: null;
            onClicked: dialog.open()
        }

        TButton{
            label.text: "Open Not centered"
            label.color: "#46A0FC"
            theme.groupName: "demo-popdialog"
            backgroundComponent: null;
            onClicked: dialog2.open()
        }

        TButton{
            label.text: "Open Input"
            label.color: "#46A0FC"
            theme.groupName: "demo-popdialog"
            backgroundComponent: null;
            onClicked: dialog_input.open()
        }

        TButton{
            label.text: "Open List view"
            label.color: "#46A0FC"
            theme.groupName: "demo-popdialog"
            backgroundComponent: null;
            onClicked: dialog_list.open()
        }


        TDialog{
            id:dialog
            titleText: "Hi Toou2D";
            contentText: "This a dialog style for default"
            buttons: [
                TDialogButton{
                    label.text: "Agree"
                    label.font.bold: true;
                    label.font.pixelSize: TPixelSizePreset.PH5
                    label.color: "#46A0FC"
                }
            ]

            onTriggered: hideAndClose();
        }


        TDialog{
            id:dialog2
            titleText: "Hi Toou2D";
            contentCenter:false;

            buttons: [
                TDialogButton{
                    label.text: "Cancel"
                    label.font.pixelSize: TPixelSizePreset.PH5
                },
                TDialogButton{
                    label.text: "Agree"
                    label.font.bold: true;
                    label.font.pixelSize: TPixelSizePreset.PH5
                    label.color: "#46A0FC"
                    lighter:true
                }
            ]

            Item{
                width: 260;
                height: 40
                TLabel{
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                    anchors.verticalCenter: parent.verticalCenter;
                    text: "This a dialog ,text is not centered"
                    theme.parent: dialog2.theme;
                    theme.childName: "content.label"
                }
            }

            onTriggered: hideAndClose();
        }


        TDialog{
            id:dialog_input
            titleText: "Tell me your name";
            closeable: false
            modalclose:false;
            buttons: [
                TDialogButton{
                    label.text: "Cancel"
                    label.font.pixelSize: TPixelSizePreset.PH5
                },
                TDialogButton{
                    label.text: "OK"
                    label.font.bold: true;
                    label.font.pixelSize: TPixelSizePreset.PH5
                    label.color: "#46A0FC"
                    lighter:true
                }
            ]
            Item{
                property alias text: input.text
                width: 260;
                height: 45;
                TInputField{
                    id:input
                    width: 240;
                    height: 35;
                    anchors.centerIn: parent;
                }
            }

            onTriggered: {
                if(button.label.text === "OK" && item.text){
                    TToast.showSuccess("Hi, " + item.text , TTimePreset.ShortTime2s);
                }
                else{
                    TToast.showError("What's your name？",TTimePreset.ShortTime2s)
                }

                hideAndClose();
            }

        }

        TDialog{
            id:dialog_list
            titleText: "ListView Dialog";
            closeable: true;
            footerComponent: null;

            Item{
                width: 260;
                height: lv.height;

                ListView{
                    id:lv
                    width: 240
                    height: 500
                    model: 99
                    anchors.horizontalCenter: parent.horizontalCenter;
                    delegate: TLabel{
                        text: "ListView Item " + index;
                        theme.parent: dialog_list.theme;
                        theme.childName: "content.label"
                    }
                }
            }
        }

    }


    TLabel{
        text: "( Theme! For real effects, please click to show)"
        anchors.horizontalCenter: parent.horizontalCenter;
    }
}
