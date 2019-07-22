import QtQuick 2.6
import Toou2D 1.0

TRectangle{
    width: text.contentWidth + margin < height ? height : text.contentWidth + margin;
    height: 25
    radius: 10;
    color: "#ef4e3a"
    theme.enabled: false;

    property int margin: 10;
    property alias font: text.font;
    property string value;

    TLabel{
        id:text;
        theme.enabled: false;
        font.bold: true;
        text: parent.value;
        color: "#fff"
        anchors.centerIn: parent;
    }
}
