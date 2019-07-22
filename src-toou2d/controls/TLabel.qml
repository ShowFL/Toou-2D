import QtQuick 2.6
import Toou2D 1.0

Text {
    property alias theme: theme;

    text: theme.text;
    color: theme.color;

    TThemeBinder{
        id:theme
        type:"Label"

        property string text: bindingString("text","");
        property color color: bindingColor("color","#000");
    }
}
