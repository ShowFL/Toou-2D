import QtQuick 2.6
import Toou2D 1.0

// 多选框
//    单独使用可以表示两种状态之间的切换
/*! TODO */
Item{
    id:toou2d_checkbox;
    width:  contentLoader.width  + padding;
    height: contentLoader.height + padding;

    property alias checked: toou2d_mouearea.checked;

    property int   padding: 20;

    property int   spacing: 5;

    property int   iconPosition : TPosition.Left;

    property alias icon: micon;

    property alias iconChecked: miconChecked;

    property alias label: mlabel;

    property alias theme: mtheme;

    property alias background: mbackground;

    property alias border: bg.border;

    property Component iconComponent;

    iconComponent: {
        if(!micon.source)
            return null;

        else if(micon.type === TIconType.Awesome)
            return awesomeiconComponent;

        return svgComponent;
    }

    state: {
        if(!enabled){
            return "disabled";
        }
        else if(checked){
            return "checked"
        }
        return "none";
    }

    TRectangle{
        id:bg;
        anchors.fill: parent;
        color:   mbackground.color;
        visible: mbackground.visible;
        radius:  mbackground.radius;
        border.color: Qt.darker(bg.color,1.1);

        theme.parent: mtheme
        theme.childName: "bg";
    }

    TMouseArea{
        id:toou2d_mouearea;
        anchors.fill: parent;
        checkable: true;
        checked:   false;
    }

    TGadgetBackground{
        id:mbackground
        color: "#ECF5FF";
        radius: 4;
        visible: false;
    }

    TGadgetLabel{
        id:mlabel;
        text: "TCheckBox"
        color: toou2d_checkbox.enabled ? "#3D3D3D" : "#9D9D9D"
    }

    TGadgetIcon{
        id:micon
        width:  18;
        height: 18;
        type:   TIconType.Awesome;
        source: TAwesomeType.FA_square_o
        color: toou2d_checkbox.enabled ? "#46A0FC" : "#9D9D9D"
    }

    TGadgetIcon{
        id:miconChecked
        width:  18;
        height: 18;
        type:   TIconType.Awesome;
        source: TAwesomeType.FA_check_square
        color: toou2d_checkbox.enabled ? "#46A0FC" : "#9D9D9D"
    }

    Loader{
        id:contentLoader;
        sourceComponent: contentRowLayoutItem
        anchors.centerIn: parent;
    }

    Component{
        id:contentRowLayoutItem;
        Row{
            id:row
            spacing: toou2d_checkbox.spacing
            layoutDirection: toou2d_checkbox.icon.position === TPosition.Left ? Qt.LeftToRight : Qt.RightToLeft;

            Loader{
                id:icon
                sourceComponent: iconComponent
                enabled: false;
                anchors.verticalCenter: row.verticalCenter;
            }

            TLabel {
                id:label;
                enabled: false;
                theme.parent: mtheme
                theme.childName: "label"

                text:  toou2d_checkbox.label.text;
                font:  toou2d_checkbox.label.font;
                color: toou2d_checkbox.label.color;
                anchors.verticalCenter: row.verticalCenter;
            }
        }
    }

    Component{
        id:awesomeiconComponent
        TAwesomeIcon{
            enabled: false;
            theme.enabled: false;
            source: !checked ? micon.source : miconChecked.source;
            color:  !checked ? micon.color  : miconChecked.color;
            width:  !checked ? micon.width  : miconChecked.width;
            height: !checked ? micon.height : miconChecked.height;
        }
    }

    Component{
        id:svgComponent
        TSVGIcon{
            enabled: false;
            theme.enabled: false;
            source: !checked ? micon.source : miconChecked.source;
            color:  !checked ? micon.color  : miconChecked.color;
            width:  !checked ? micon.width  : miconChecked.width;
            height: !checked ? micon.height : miconChecked.height;
        }
    }


    TThemeBinder{
        id:mtheme
        className: "TCheckBox";
        state: toou2d_checkbox.state;

        TThemeBinder{
            childName: "icon"
            property alias color:  micon.color;
            property alias width:  micon.width;
            property alias height: micon.height;
        }

        TThemeBinder{
            childName: "icon.checked"
            property alias color:  miconChecked.color;
            property alias width:  miconChecked.width;
            property alias height: miconChecked.height;
        }

        Component.onCompleted: initialize();
    }
}
