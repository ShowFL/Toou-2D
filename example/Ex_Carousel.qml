import QtQuick 2.6
import Toou2D 1.0

Column {
    spacing: 20
    TCarousel{
        width: 400;
        height: 180
        itemWidth: 350;
        itemHeight:160;
        theme.groupName: "only"

        TCarouselElement{
            otherData: "#409EFF"
        }

        TCarouselElement{
            otherData: "#67C23A"
        }

        TCarouselElement{
            otherData: "#E6A23C"
        }

        TCarouselElement{
            otherData: "#F56C6C"
        }

        contentComponent:Rectangle{
            color: modelData.otherData;
            Column{
                anchors.centerIn: parent;
                spacing: 10
                TLabel{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    font.pixelSize: 50;
                    color: "#FFF"
                    font.bold: true;
                    text: modelData.index;
                }
                TLabel{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    font.pixelSize: 22;
                    color: "#FFF"
                    font.bold: true;
                    text: modelData.otherData;
                }
            }
        }
    }

    TCarousel{
        width: 400;
        height: 180
        itemWidth: width;
        itemHeight:height;
        pathItemCount: 3

        TCarouselElement{
            otherData: "#409EFF"
        }

        TCarouselElement{
            otherData: "#67C23A"
        }

        TCarouselElement{
            otherData: "#E6A23C"
        }

        TCarouselElement{
            otherData: "#F56C6C"
        }

        contentComponent:Rectangle{
            color: modelData.otherData;
            Column{
                anchors.centerIn: parent;
                spacing: 10
                TLabel{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    font.pixelSize: 50;
                    color: "#FFF"
                    font.bold: true;
                    text: modelData.index;
                }
                TLabel{
                    anchors.horizontalCenter: parent.horizontalCenter;
                    font.pixelSize: 22;
                    color: "#FFF"
                    font.bold: true;
                    text: modelData.otherData;
                }
            }
        }
    }
}
