import QtQuick 2.0
import Toou2D 1.0

TRectangle{
    theme.className: "appbottom";
    anchors.bottom: parent.bottom;

    Row{
        spacing: 10;
        anchors.centerIn: parent;
        TAwesomeIcon{
            source: T2D.FA_github
            color: "#fff"
            width: 20;
            height: 20;
        }

        TLabel{
            text: "Powered by 2d.toou.net";
            color: "#fff";
            font.bold: true;
            font.pixelSize: 15;
        }

    }
}
