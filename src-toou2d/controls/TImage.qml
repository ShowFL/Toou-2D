import QtQuick 2.6
import Toou2D 1.0

// 图片容器，保留了Qt原生img的特性*/
/*! TODO */
Image {
    id:toou2d_image

    property alias theme: theme;

    TThemeBinder{
        id:theme
        className: "TImage"
        state:  toou2d_image.state;

        property alias source: toou2d_image.source;
        property alias width:  toou2d_image.width;
        property alias height: toou2d_image.height;

        Component.onCompleted: initialize();
    }
}
