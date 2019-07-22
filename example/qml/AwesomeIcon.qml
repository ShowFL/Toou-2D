import QtQuick 2.0
import Toou2D 1.0

TRectangle {
    id:screen
    theme.className: "background"

    GridView{
        clip: true;
        anchors.horizontalCenter: parent.horizontalCenter;
        width:Math.floor(screen.width / cellWidth) * cellWidth;
        height: parent.height;
        cellWidth: 100;
        cellHeight: 60

        model: T2D.awesomelist();

        delegate: Item{
            clip: true;
            width: 100;
            height: 60;
            TAwesomeIcon{
                source: modelData;
                width: 20;
                height: 20;
                anchors.centerIn: parent;
            }

            TLabel{
                text: modelData;
                font.pixelSize: 10;
                anchors.bottom: parent.bottom;
                anchors.horizontalCenter: parent.horizontalCenter;
                onContentWidthChanged: {
                    if(contentWidth > parent.width){
                        text = text.slice(0,10) + "..";
                    }
                }
            }

            MouseArea{
                anchors.fill: parent;
                onClicked: TToast.showMessage(modelData,TToast.shortTime);
            }
        }
    }

    //    Column{
    //        anchors.centerIn: parent;
    //        spacing: 50;

    //        Row{
    //            spacing: 50;
    //            TAwesomeIcon{
    //                source: T2D.FA_android
    //                width: 20;
    //                height: 20;
    //            }

    //            TAwesomeIcon{
    //                source: "FA_android"      //T2D.FA_android or "FA_android"
    //                width: 40;
    //                height: 40;
    //            }

    //            TAwesomeIcon{
    //                source:  "FA_android"
    //                width: 60;
    //                height: 60;
    //            }
    //        }

    //        Row{
    //            spacing: 50;
    //            TAwesomeIcon{
    //                source: T2D.FA_spinner
    //                width: 60;
    //                height: 60;
    //                NumberAnimation on rotation {
    //                    from:0
    //                    to: 360
    //                    duration: 800
    //                    loops: Animation.Infinite
    //                }
    //            }

    //            TAwesomeIcon{
    //                source: T2D.FA_refresh
    //                width: 40;
    //                height: 40;
    //                NumberAnimation on rotation {
    //                    from:0
    //                    to: 360
    //                    duration: 1000
    //                    loops: Animation.Infinite
    //                }
    //            }

    //            TAwesomeIcon{
    //                source: T2D.FA_circle_o_notch
    //                width: 20;
    //                height: 20;
    //                NumberAnimation on rotation {
    //                    from:0
    //                    to: 360
    //                    duration: 2000
    //                    loops: Animation.Infinite
    //                }
    //            }
    //        }
    //    }
}
