import QtQuick 2.0
import Toou2D 1.0

Item{
    id:page
    GridView{
        id:gview
        clip: true;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.fill: parent;
        cellWidth: 120;
        cellHeight: 60

        model: T2D.awesomelist();

        delegate: Item{
            clip: true;
            width: 110;
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
        }
    }

    TScrollbarV{
        target: gview
        anchors.right: parent.right;
        height: parent.height;
    }
}
