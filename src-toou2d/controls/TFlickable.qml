import QtQuick 2.6
import Toou2D 1.0

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

    onContentXChanged: autohideTimer.reset();

    onContentYChanged: autohideTimer.reset();

    TGadgetScrollbar{
        id:scrollBar;
        vertical:  true;
        horizontal: true;
    }

    children: [
        TScrollbarV{
            id:scrllbarv
            visible: scrollBar.vertical;
        },
        TScrollbarH{
            id:scrllbarh
            visible: scrollBar.horizontal;
        }
    ]

    Timer {
        id:autohideTimer;
        interval: 2000;
        running: scrollBar.autoHide;
        repeat: true
        onTriggered: {
            scrllbarv.hide = true;
            scrllbarh.hide = true;
        }

        function reset(){
            if(scrollBar.autoHide){
                scrllbarv.hide = false;
                scrllbarh.hide = false;
                restart();
            }
        }
    }

}
