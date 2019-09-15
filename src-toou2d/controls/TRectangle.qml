import QtQuick 2.6
import Toou2D 1.0

/* 矩形实体颜色区域 */
/*! TODO */
Rectangle {
    id:toou2d_rect

    property alias theme: mtheme;

    color: "#FAFAFA";

    border.width: 0;

    border.color: Qt.darker(color,1.1)

    TThemeBinder{
        id:mtheme;
        state:     toou2d_rect.state;
        className: "TRectangle";

        property alias color:   toou2d_rect.color;
        property alias width:   toou2d_rect.width;
        property alias height:  toou2d_rect.height;
        property alias radius:  toou2d_rect.radius;
        property alias opacity: toou2d_rect.opacity;

        TThemeBinder{
            target:     toou2d_rect.border;
            childName:  "border";

            property int   width: toou2d_rect.border.width;
            property color color: toou2d_rect.border.color;
        }

       Component.onCompleted: {
           initialize();
       }
    }

}
