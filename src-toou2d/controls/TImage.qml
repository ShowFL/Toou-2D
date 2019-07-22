import QtQuick 2.6
import Toou2D 1.0

Image {
    source: theme.source;

    property alias theme: theme;

    TThemeBinder{
        id:theme;
        type:"Image"
        property string source: bindingString("source","");
    }
}
