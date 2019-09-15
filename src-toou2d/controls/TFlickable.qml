import QtQuick 2.6
import Toou2D  1.0

//! 一个可操控的滚动区域,并带有滚动条。
/*! TODO */
Flickable{
    id:toou2d_flickable;

    /*! set default property*/
    flickableDirection: Flickable.AutoFlickDirection;

    /*! set default property*/
    boundsBehavior:     Flickable.StopAtBounds

    /*! 配置滚动条相关属性*/
    property alias scrollBar: scrollBar

    TGadgetScrollbar{
        id:scrollBar;
        vertical:   true;
        horizontal: true;
    }

    children: [
        TScrollbarV{
            id:scrllbarv
            target: toou2d_flickable
            height: parent.height;
            anchors.right: toou2d_flickable.right;
            visible: scrollBar.vertical;
        },
        TScrollbarH{
            id:scrllbarh
            target: toou2d_flickable;
            width: parent.width;
            anchors.bottom: toou2d_flickable.bottom;
            visible: scrollBar.horizontal;
        }
    ]
}
