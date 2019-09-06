import QtQuick 2.6
import Toou2D 1.0

// 区隔内容的分割线。*/
/*! TODO */
Rectangle {
    id:toou2d_line

    property alias theme: theme;

    color: "#DCDFE6"

    TThemeBinder{
        id:theme;
        state:     toou2d_line.state;
        className: "TDividerLine";

        property alias color: toou2d_line.color;

        Component.onCompleted: initialize();
    }

}
