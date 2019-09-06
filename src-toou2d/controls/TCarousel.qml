import QtQuick 2.6
import Toou2D 1.0

//在有限空间内，循环播放同一类型的图片、或者其它自定义Item内容*/
/*! TODO */
Item {
    id:toou2d_carousel
    clip: true;

    signal triggered(var modelData);

    property int itemWidth;

    property int itemHeight;

    property int margen:   itemWidth / 3;

    property int interval: TTimePreset.ShortTime2s;

    property int pathItemCount: 3;

    property alias count: pathView.count;

    property alias currentIndex: pathView.currentIndex;

    property alias currentItem:  pathView.currentItem;

    property alias theme: mtheme;

    default property alias childs: toou2d_carousel.chillilst;

    property list<TCarouselElement> chillilst;

    property Component contentComponent;

    function addElement(element){
        pathView.model.append(element);
    }

    function decrementCurrentIndex(){
        pathView.decrementCurrentIndex();
    }

    function incrementCurrentIndex(){
        pathView.incrementCurrentIndex();
    }

    contentComponent: TAvatar{
        anchors.fill: parent;
        source: modelData.imageSource;
        radius: 10;
        theme.state:     mtheme.state;
        theme.className: mtheme.className;
        theme.groupName: mtheme.groupName;
    }

    PathView {
        id: pathView;

        anchors.fill:  parent;
        interactive:   false;
        preferredHighlightBegin: 0.5;
        preferredHighlightEnd:   0.5;
        pathItemCount:      toou2d_carousel.pathItemCount;
        cacheItemCount:     model.count;
        highlightRangeMode: PathView.StrictlyEnforceRange;
        model: ListModel{}

        delegate: Loader {
            //可供contentComponent 使用
            property int  itemIndex:     index;
            property var  modelData:     model;
            property bool isCurrentItem: PathView.isCurrentItem;

            width:   itemWidth;
            height:  itemHeight;
            z:       PathView.zOrder;
            scale:   PathView.itemScale;
            visible: PathView.onPath

            sourceComponent: contentComponent;
        }

        path:Path {
            startX: margen;
            startY: toou2d_carousel.height / 2 ;
            PathAttribute { name: "zOrder"; value: 0 }
            PathAttribute { name: "itemScale"; value: 0.8 }
            PathLine { x: toou2d_carousel.width / 2; y: toou2d_carousel.height / 2; }
            PathAttribute { name: "zOrder"; value: 10 }
            PathAttribute { name: "itemScale"; value: 1 }
            PathLine { x: toou2d_carousel.width - margen; y: toou2d_carousel.height / 2; }
            PathAttribute { name: "zOrder"; value: 0 }
            PathAttribute { name: "itemScale"; value: 0.8 }
        }

        Component.onCompleted: {
            for(var i in chillilst) pathView.model.append(chillilst[i]);
        }

        onCurrentIndexChanged: autoNextTimer.restart();
    }

    TMouseArea{
        anchors.fill: parent;
        property int px:  0;
        property int dis: 10;
        hoverEnabled: true;

        onPressed: px = mouseX;
        onReleased: {
            if(Math.abs(px - mouseX) > dis){
                if(px < mouseX)
                    pathView.decrementCurrentIndex();
                else if(px > mouseX)
                    pathView.incrementCurrentIndex();
            }else{
                var c = pathView.currentItem;
                if(mouseX < c.x)
                    pathView.decrementCurrentIndex();
                else if(mouseX > c.x + c.width)
                    pathView.incrementCurrentIndex();
                else
                    triggered(c.modelData);
            }
            autoNextTimer.restart();
        }
    }


    Timer {
        id:autoNextTimer
        interval: toou2d_carousel.interval; running: toou2d_carousel.interval > 0; repeat: true
        onTriggered: pathView.incrementCurrentIndex();
    }

    TThemeBinder{
        id:mtheme;
        className: "TCarousel"

        property alias itemWidth:  toou2d_carousel.itemWidth;
        property alias itemHeight: toou2d_carousel.itemHeight;

        Component.onCompleted: initialize();
    }
}
