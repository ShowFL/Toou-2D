import QtQuick 2.6
import Toou2D 1.0

Item{
    Loader{
        id:loader;
        anchors.fill: parent;
        asynchronous: true
        onStatusChanged: bi.visible = status !==Loader.Ready
    }

    Component{
        id:contentComponent;
        TFlickable{
            clip: true
            contentWidth:width;
            contentHeight: layout.height;
            scrollBar.horizontal: false;
            Column{
                id:layout
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Item{
                    width: 10;
                    height: 10;
                }

                //--
                TLabel{
                    text: "TRectangle";
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Rectangle{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TLabel";
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TRadioBox"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Radio{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TSwitch"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Switch{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TCheckBox"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_CheckBox{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}
                //--
                TLabel{
                    text: "TInputField"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_InputField{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TButton"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }
                Ex_Button{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TIconButton"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_IconButton{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TProgress"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Progress{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TPagination"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Pagination{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TBadge"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Badge{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TToast"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Toast{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TBusyIndicator"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Loading{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TDividerLine"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_DividerLine{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TCarousel"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Carousel{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TDialog"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Dialog{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TAvatar"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Avatar{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}


                //--
                TLabel{
                    text: "TNavigationBar"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_NavigationBar{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TTag"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Tag{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}


                //--
                TLabel{
                    text: "TPopover"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Popover{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}


                //--
                TLabel{
                    text: "TSVGicon"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_SVGicon{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TAwesomelIcon"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_AwesomelIcon{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}

                //--
                TLabel{
                    text: "TImage"
                    font.pixelSize: TPixelSizePreset.PH4
                    font.bold: true
                }

                Ex_Image{
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item{width: 10;height: 20;}
            }

        }
    }

    TBusyIndicator{
        id:bi;
        anchors.centerIn: parent;
    }

    Component.onCompleted: {
        loader.sourceComponent = contentComponent;
    }

}
