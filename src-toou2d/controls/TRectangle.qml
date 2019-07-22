import QtQuick 2.6
import Toou2D 1.0

Rectangle {
    color: theme.color;

    radius: theme.radius;

    border.color: theme.border_color;

    border.width: theme.border_width;

    property alias theme: theme;

    TThemeBinder{
        id:theme;

        type: "Rectangle"

        property color color: bindingColor("color","#fff");

        property int   radius: bindingInt("radius",0);

        property color border_color: bindingColor("border_color","#5d5d5d");

        property int   border_width: bindingInt("border_width",0);
    }
}
