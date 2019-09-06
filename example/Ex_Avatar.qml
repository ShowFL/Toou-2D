import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 15;

    Row{
        id:layout
        spacing: 20

        TAvatar{
            width: 60;
            height: 60;
            source: "qrc:/res/0.jpg"
            radius: 5;
        }

        TAvatar{
            width: 60;
            height: 60;
            source: "qrc:/res/1.jpg"
            radius: 20;
        }

        TAvatar{
            width: 60;
            height: 60;
            source: "qrc:/res/2.jpg"
            radius: height / 2;
            border.width: 1;
            border.color: "#F56C6C"
        }

        TAvatar{
            width: 60;
            height: 60;
            source: "qrc:/res/3.jpg"
            radius: 20;
        }

        TAvatar{
            width: 60;
            height: 60;
            source: "qrc:/res/4.jpg"
            radius: 5;
        }

    }

}
