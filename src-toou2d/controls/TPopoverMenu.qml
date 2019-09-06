import QtQuick 2.6
import Toou2D 1.0

// 定点弹出框
//    与Dialog 不同的时他的小窗是指定位置的。
//    自带bodyLoaderItem逻辑过于简单，复杂类型还需要重新定义bodyLoaderItem
//    自定义 bodyLoaderItem, 当自定义以后Element将无效。如果自定义的是ListView那么需要自行绑定model

//    TPopoverMenu{
//        TPopoverElement{

//        }
//    }
/*! TODO */
TPopover{
    id:toou2d_popover;

    signal triggered(var modelData);

    property alias groupBackground: mGroupBG;

    property alias groupLabel: mGroupLabel;

    property alias itemLabel:mItemLabel

    property alias itemBackground:mItemBg;

    property alias activeItemLabel: mActItemLabel;

    property alias itemIcon: mItemIcon;

    property alias activeItemIcon: mActItemIcon;

    property Component groupComponent: defaultGroupComponent;

    property Component itemComponent :defaultItemComponent;

    padding: 8;

    bodyWidth: 150;

    bodyComponent: menubodyComponent;

    theme.className: "TPopoverMenu"

    default property list<QtObject> elementlist;

    function addElement(obj){
        _mprivate.dynamicList.push(obj);
    }

    TGadgetBackground{
        id:mGroupBG;
        color: bodyBackground.color
    }

    TGadgetLabel{
        id:mGroupLabel;
        font.pixelSize: TPixelSizePreset.PH7
    }

    TGadgetLabel{
        id:mItemLabel;
        color: "#2D2D2D"
        property bool bold:      font.bold;
        property int  pixelSize: font.pixelSize;
    }

    TGadgetBackground{
        id:mItemBg;
        color: "#409EFF";
    }

    TGadgetLabel{
        id:mActItemLabel;
        color: "#FFF"
        property bool bold:      font.bold;
        property int  pixelSize: font.pixelSize;
    }

    TGadgetIcon{
        id:mItemIcon
    }

    TGadgetIcon{
        id:mActItemIcon
        color: "#FFF"
    }


    Component{
        id:menubodyComponent;
        TRectangle{
            width:  bodyWidth  + border.width * 4;
            height: crowlayout.height + padding;
            color:  bodyBackground.color;
            radius: bodyBackground.radius
            border.width: bodyBorder.width;
            border.color: bodyBorder.color;

            theme.parent: toou2d_popover.theme;
            theme.childName: "body";

            ListModel{ id:listmodel }

            Column{
                id:crowlayout;
                anchors.centerIn: parent;

                Repeater{
                    objectName: "repeater"
                    id:repeater
                    model:{
                        for(var i in elementlist){
                            if(elementlist[i].type === "item" || elementlist[i].type === "group")
                                listmodel.append(elementlist[i]);
                        }

                        for(var l in _mprivate.dynamicList){
                            if(_mprivate.dynamicList[l].type === "item" || _mprivate.dynamicList[l].type === "group")
                            listmodel.append(_mprivate.dynamicList[l]);
                        }

                        return listmodel;
                    }

                    delegate: Loader{
                        id:load
                        property int modelIndex: index;
                        property var modelData:  model;
                        width: toou2d_popover.bodyWidth;
                        sourceComponent:{
                            if(model.type === "item"){
                                return itemComponent;
                            }
                            return groupComponent;
                        }
                    }
                }
            }
        }
    }

    Component{
        id:defaultGroupComponent
        Item{
            id:group
            height:20;
            TRectangle{
                anchors.fill: parent;
                color:   mGroupBG.color;
                radius:  mGroupBG.radius;
                visible: mGroupBG.visible;

                theme.parent: toou2d_popover.theme;
                theme.childName: "group.bg";
            }

            TLabel{
                anchors.verticalCenter: group.verticalCenter;
                anchors.left: group.left;
                anchors.leftMargin: 15;
                text:     modelData.text;
                color:    mGroupLabel.color
                font.bold:mGroupLabel.font.bold;
                font.pixelSize: mGroupLabel.font.pixelSize;

                theme.parent: toou2d_popover.theme;
                theme.childName: "group.label";
            }
        }
    }

    Component{
        id:defaultItemComponent;
        Item{
            property bool active: _mprivate.actieIndex === modelIndex;
            height: 26;
            TRectangle{
                anchors.fill: parent;
                color:  mItemBg.color;
                radius: mItemBg.radius;
                visible:active;
                z:-1

                theme.parent: toou2d_popover.theme;
                theme.childName: "item.bg";
            }

            TIconButton{
                id:btn;
                width:  parent.width;
                height: parent.height;
                spacing: 10
                padding: 15;
                hoverEnabled:  true
                contentHAlign: Qt.AlignLeft;
                backgroundComponent: null;

                icon.source: modelData.iconSource;
                icon.color:  active ? mActItemIcon.color : mItemIcon.color;
                icon.width:  active ? mActItemIcon.width : mItemIcon.width;
                icon.height: active ? mActItemIcon.height: mItemIcon.height;

                label.text:  modelData.text;
                label.color: active ? mActItemLabel.color : mItemLabel.color;
                label.font.pixelSize: active ? mActItemLabel.pixelSize : mItemLabel.pixelSize;
                label.font.bold: active ? mActItemLabel.bold : mItemLabel.bold;

                onStateChanged: {
                    _mprivate.actieIndex = (state === "hovering" || state === "pressed") ?  modelIndex : -1;}
                onClicked:{ triggered(modelData);toou2d_popover.close();}

                theme.enabled: false;
            }
        }
    }

    TObject{
        id:_mprivate

        property int actieIndex: -1;
        property var dynamicList : [];

        TThemeBinder{
            parent: toou2d_popover.theme;

            TThemeBinder{
                target: mActItemLabel;
                childName: "active.item.label"
                property color  color:      mActItemLabel.color;
                property bool   bold:       mActItemLabel.bold;
                property int    pixelSize:  mActItemLabel.pixelSize;
            }

            TThemeBinder{
                target: mActItemIcon;
                childName: "active.item.icon"
                property color color:  mActItemIcon.color;
                property int   width:  mActItemIcon.width;
                property int   height: mActItemIcon.height;
            }

            TThemeBinder{
                target: mItemLabel;
                childName: "item.label"
                property color  color:      mItemLabel.color;
                property bool   bold:       mItemLabel.bold;
                property int    pixelSize:  mItemLabel.pixelSize;
            }

            TThemeBinder{
                target: mItemIcon;
                childName: "item.icon"
                property color color:  mItemIcon.color;
                property int   width:  mItemIcon.width;
                property int   height: mItemIcon.height;
            }

            Component.onCompleted: initialize();
        }
    }
}
