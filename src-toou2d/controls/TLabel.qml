import QtQuick 2.6
import QtQml 2.2
import Toou2D 1.0

/*! TODO */
Text {
    id: toou2d_label

    property alias theme: mtheme;

    color: "#303133"

    TThemeBinder{
        id:mtheme
        className: "TLabel"
        state: toou2d_label.state;

        property alias color: toou2d_label.color;
        property alias text:  toou2d_label.text;

        property alias bold:     toou2d_wrapper_font.bold;
        property alias family:   toou2d_wrapper_font.family;
        property alias pixelSize:toou2d_wrapper_font.pixelSize;

        Component.onCompleted: initialize();
    }

    TObject{
        id:toou2d_wrapper_font;

        property alias bold:      toou2d_label.font.bold;
        property alias family:    toou2d_label.font.family;
        property alias pixelSize: toou2d_label.font.pixelSize;
    }

}
