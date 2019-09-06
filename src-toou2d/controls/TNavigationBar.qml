import QtQuick 2.0
import Toou2D 1.0

// 固定导航横向的
//    分隔内容上有关联但属于不同类别的数据集合。
//    添加附属item需要使用 children:[Item... ]

//    自定义item 可使用的Loder属性
//    var  modelData
//    bool isActiveItem

//        TNavigationBar{
//            spacing: 5;
//            color: "#FFF";

//            TNavigationElement{
//                label: "Hello";
//            }
//        }

/*! TODO */
Item {
    id:toou2d_navigationbar

    width: contentLayout.width  + padding;
    height:contentLayout.height + padding;

    /*! button被点击触发的信号，同时携带这个button*/
    signal triggered(var modelData);

    property int itemWidth: 0;

    property int itemHeight: 0;

    /*!内边距填充大小*/
    property int   padding: 8;

    property int   spacing: 10;

    property alias label: mlabel;

    property alias activeLabel: mactiveLabel;

    property alias icon: micon;

    property alias activeIcon: mactiveIcon;

    property alias theme: mtheme;

    property Component itemComponent;

    property int   currentIndex: -1;

    default property alias contentchild: _private.elements;

    readonly property Item currentItem: {
        if(currentIndex >= 0 && currentIndex < contentLayout.children.length){
            contentLayout.children[currentIndex].x;
            return contentLayout.children[currentIndex];
        }
        return null;
    }

    itemComponent: TIconButton{
        padding: 10;
        backgroundComponent: null;
        theme.enabled: false;

        label.text : modelData.text ?  modelData.text : modelData.index;
        label.color: isActiveItem ? mactiveLabel.color : mlabel.color;
        label.font:  isActiveItem ? mactiveLabel.font  : mlabel.font;

        icon.source: modelData.iconSource;
        icon.color:  isActiveItem  ? mactiveIcon.color  : micon.color;
        icon.width:  isActiveItem  ? mactiveIcon.width  : micon.width;
        icon.height: isActiveItem  ? mactiveIcon.height : micon.height;

        onClicked: {
            toou2d_navigationbar.currentIndex = modelData.index;
            triggered(modelData);
        }

        Timer {
            interval: 10; running: true;
            onTriggered:{
                width = itemWidth   > 0 ? itemWidth  : contentWidth + padding;
                height = itemHeight > 0 ? itemHeight : contentHeight + padding;
            }
        }
    }

    TGadgetLabel{
        id:mlabel;
        color: "#303133"
    }

    TGadgetLabel{
        id:mactiveLabel;
        color: "#000"
        font.bold: true;
        font.pixelSize: 16;
    }

    TGadgetIcon{
        id:micon;
        color: "#303133"
    }

    TGadgetIcon{
        id:mactiveIcon;
        color: "#000"
        width: 20;
        height: 20;
    }

    TObject{
        id:_private;
        property list<TNavigationElement> elements;
    }

    Row{
        id:contentLayout;
        anchors.verticalCenter: parent.verticalCenter
        spacing: toou2d_navigationbar.spacing;
        Repeater{
            id:repeater
            model: ListModel{ }
            delegate: Loader{
                property var  modelData:    model;
                property bool isActiveItem: toou2d_navigationbar.currentIndex === index;

                anchors.verticalCenter: parent.verticalCenter;
                sourceComponent: itemComponent;
            }
        }
    }

    Component.onCompleted: {
        for(var i in _private.elements) repeater.model.append(_private.elements[i]);
        if(_private.elements.length > 0 && currentIndex === -1) currentIndex = 0;
    }

    TThemeBinder{
        id:mtheme;
        className: "TNavigationBar"

        TThemeBinder{
            target: mlabel;
            childName: "label";

            property color  color:    mlabel.color;
            property bool   bold:     mlabel.font.bold;
            property int    pixelSize:mlabel.font.pixelSize;
            property string family:   mlabel.font.family;
        }

        TThemeBinder{
            target: mactiveLabel;
            childName: "active.icon";

            property color  color:    mactiveLabel.color;
            property bool   bold:     mactiveLabel.font.bold;
            property int    pixelSize:mactiveLabel.font.pixelSize;
            property string family:   mactiveLabel.font.family;
        }

        TThemeBinder{
            target: micon;
            childName: "icon";

            property color color: micon.color;
            property int   width: micon.width;
            property int   height:micon.height;
        }

        TThemeBinder{
            target: mactiveIcon;
            childName: "active.icon";

            property color color: mactiveIcon.color;
            property int   width: mactiveIcon.width;
            property int   height:mactiveIcon.height;
        }

        Component.onCompleted: initialize();
    }

}
