import QtQuick 2.0
import Toou2D 1.0
import "qrc:/util.js" as Util
Item {
    clip: true
    WorkerScript {
        id: worker
        source: "qrc:/util.js"

        onMessage: {
            if(messageObject.error){
                TToast.showError("Error",TTimePreset.LongTime4s,messageObject.info);
            }else{
                tbi.visible = false;
                if(messageObject.length > 0){
                    listview.model = messageObject;
                }else{
                    warningitem.visible = true;
                }
            }
        }
    }

    TBusyIndicator{
        id:tbi
        z:1
        width: 30;
        height: 10;
        anchors.centerIn: parent;
    }

    Column{
        id:warningitem;
        visible: false;
        anchors.centerIn: parent;
        spacing: 20;
        TLabel{
            text: "No demo update"
            font.pixelSize: TPixelSizePreset.PH4
        }

        TButton{
            label.text: "Toou2D Github"
            onClicked: Qt.openUrlExternally("https://github.com/ShowFL/Toou-2D")
        }
    }

    ListView{
        id:listview;
        anchors.fill: parent;
        spacing: 30;
        model: ListModel{}
        header:Item{
            width: 10;
            height: 20;
        }

        footer: Item{
            width: 10;
            height: 20;
        }

        delegate: TRectangle{
            width: 440;
            height: 310;
            radius: 2
            theme.groupName: "demoitembg"
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#F0F0F0"

            TRectangle{
                id:sample
                width: 420;
                height: 240;
                anchors.top: parent.top;
                anchors.topMargin: 10;
                anchors.horizontalCenter: parent.horizontalCenter;
                color: "#FFF"
                TBusyIndicator{
                    contentComponent: defaultDotAnimator;
                    anchors.centerIn: parent;
                }

                TImage{
                    source: modelData.sample;
                    anchors.fill: parent;
                    anchors.margins: 5;
                    asynchronous: true
                }
            }


            Column{
                spacing: 5
                anchors.top: sample.bottom;
                anchors.topMargin: 10
                anchors.left: parent.left;
                anchors.leftMargin: 10
                TLabel {
                    text: modelData.name + "    Author:" + modelData.author;
                    font.pixelSize: TPixelSizePreset.PH5;
                    font.bold: true
                }

                TLabel {
                    text: modelData.describe;
                    font.pixelSize: TPixelSizePreset.PH6;
                }
            }

            Item{
                anchors.top: sample.bottom;
                anchors.bottom: parent.bottom;
                anchors.right: parent.right;
                anchors.rightMargin: 10
                TIconButton{
                    backgroundComponent: null;
                    icon.source: TAwesomeType.FA_cloud_download
                    label.text: "Download"
                    anchors.right: parent.right;
                    anchors.verticalCenter: parent.verticalCenter;
                    onClicked: {
                        console.log("download:" ,modelData.url);
                        if(modelData.url){

                            Qt.openUrlExternally(modelData.url)
                        }else{
                            TToast.showWarning("Under production",TTimePreset.LongTime4s,"上线时间敬请期待。");
                        }
                    }
                }
            }

        }
    }

    TLabel{
        visible: tbi.visible;
        anchors.centerIn: parent;
        anchors.verticalCenterOffset: 50;
        text: "Data from Github effort loading"
        font.pixelSize: TPixelSizePreset.PH6
    }


    TScrollbarV{
        target: listview
    }

    Component.onCompleted: {
        TToast.showSuccess("Data from Github",TTimePreset.LongTime4s);
        worker.sendMessage({'action': 'httpget','version': T2D.version()});
    }
}
