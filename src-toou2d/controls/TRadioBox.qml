import QtQuick 2.6
import Toou2D 1.0

/* 单选框
    在一组备选项中进行单选 (需要放入 TRadioBoxGroup)
    不在组中的RadioBox无法改变状态
*/
/*! TODO */
Item{
    id:toou2d_radiobox;
    objectName: Math.random();
    width:  contentLoader.width  + padding;
    height: contentLoader.height + padding;

    property bool  checked;

    /*! 内边距 设置内容与外边框的间距*/
    property int   padding: 20;

    /*!设置图标与文本间隙*/
    property int   spacing: 5;

    property int   iconPosition : TPosition.Left;

    property int   groupIndex: -1;

    property alias icon: micon;

    property alias iconChecked: miconChecked;

    property alias label: mlabel;

    property alias theme: mtheme;

    property alias background: mbackground;

    property alias border: bg.border;

    property Component iconComponent;

    iconComponent:  {
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

    TGadgetBackground{
        id:mbackground
        color: "#ECF5FF";
        radius: 4;
        visible: false;
    }

    TGadgetLabel{
        id:mlabel;
        text: "TRadioBox"
        color: toou2d_radiobox.enabled ? "#3D3D3D" : "#9D9D9D"
    }

    TGadgetIcon{
        id:micon
        width:  18;
        height: 18;
        type:   TIconType.Awesome;
        source: TAwesomeType.FA_circle_o
        color: toou2d_radiobox.enabled ? "#46A0FC" : "#9D9D9D"
    }

    TGadgetIcon{
        id:miconChecked
        width:  18;
        height: 18;
        type:   TIconType.Awesome;
        source: TAwesomeType.FA_dot_circle_o
        color: toou2d_radiobox.enabled ? "#46A0FC" : "#9D9D9D"
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
        onClicked: toou2d_radiobox.checked = true;
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
            spacing: toou2d_radiobox.spacing
            layoutDirection: toou2d_radiobox.iconPosition === TPosition.Left ? Qt.LeftToRight : Qt.RightToLeft;

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

                text:  toou2d_radiobox.label.text;
                font:  toou2d_radiobox.label.font;
                color: toou2d_radiobox.label.color;
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
        className: "TRadioBox";
        state: toou2d_radiobox.state

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
