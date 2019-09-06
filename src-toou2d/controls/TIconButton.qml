import QtQuick 2.6
import Toou2D 1.0

// 常用的操作按钮。
//    支持展示小图标
/*! TODO */
TButton {
    id:toou2d_iconbutton
    theme.className: "TIconButton"

    /*!设置图标样式 iconComponent 自定义后该属性设置将无效*/
    property alias icon: micon;

    /*!设置图标与文本间隙*/
    property int spacing: 5;

    /*!根据不同需求得新定义Icon，icon可能是一个图标，SVG图标，一个意想不到?什么鬼? :)*/
    property Component iconComponent;

    /*!不建议重新赋值，否则此控件将失去意义*/
    contentComponent: {
        if(micon.position === TPosition.Only)
            return contentOnlyiconItem;

        else if(micon.position === TPosition.Left || icon.position === TPosition.Reght)
            return contentRowLayoutItem;

        else if(micon.position === TPosition.Top)
            return contentColumnLayoutItem;

        return null;
    }

    iconComponent: {
        if(!micon.source)
            return null;

        else if(micon.type === TIconType.SVG || micon.source.indexOf(".svg") != -1){
            return svgComponent;
        }

        return awesomeiconComponent;
    }

    TGadgetIcon{
        id:micon;
        color:  "#2D2D2D";
        width:  18;
        height: 18;

        position: TPosition.Left;
    }

    Component{
        id:contentOnlyiconItem;
        Loader{
            scale:  toou2d_iconbutton.theme.scale;
            sourceComponent: iconComponent;
        }
    }

    Component{
        id:contentRowLayoutItem;
        Row{
            id:row
            spacing: toou2d_iconbutton.spacing
            scale:   toou2d_iconbutton.theme.scale;
            layoutDirection: toou2d_iconbutton.icon.position === TPosition.Left ? Qt.LeftToRight : Qt.RightToLeft;

            Loader{
                id:icon;
                sourceComponent: iconComponent
                enabled: false;
                visible: iconComponent;
                anchors.verticalCenter: row.verticalCenter;
            }

            TLabel {
                id:label;
                enabled: false;
                theme.parent:   toou2d_iconbutton.theme;
                theme.childName: "label"

                text:  toou2d_iconbutton.label.text;
                font:  toou2d_iconbutton.label.font;
                color: toou2d_iconbutton.label.color;

                anchors.verticalCenter: row.verticalCenter;
            }
        }
    }

    Component {
        id:contentColumnLayoutItem;
        Column{
            spacing: toou2d_iconbutton.spacing;
            scale:   toou2d_iconbutton.theme.scale;

            Loader{
                enabled: false;
                sourceComponent: iconComponent
                anchors.horizontalCenter: parent.horizontalCenter;
            }

            TLabel {
                id:label;
                enabled: false;
                theme.parent:   toou2d_iconbutton.theme;
                theme.childName: "label"

                text:  toou2d_iconbutton.label.text;
                font:  toou2d_iconbutton.label.font;
                color: toou2d_iconbutton.label.color;

                anchors.horizontalCenter: parent.horizontalCenter;
            }
        }
    }

    Component{
        id:awesomeiconComponent
        TAwesomeIcon{
            enabled: false;
            theme.childName: "icon"
            theme.parent: toou2d_iconbutton.theme;

            source: micon.source;
            color:  micon.color;
            width:  micon.width;
            height: micon.height;
        }
    }

    Component{
        id:svgComponent
        TSVGIcon{
            enabled: false;
            theme.parent: toou2d_iconbutton.theme;
            theme.childName: "icon"

            source: micon.source;
            color:  micon.color;
            width:  micon.width;
            height: micon.height;
        }
    }
}
