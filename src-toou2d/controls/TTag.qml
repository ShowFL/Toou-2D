import QtQuick 2.6
import Toou2D 1.0

/* 一个flags文本标签
    用于标记和选择。
    TTag{
       label.text: "TTag"
    }
*/
/*! TODO */
TMouseArea{
    id:toou2d_tag;

    /*! 关闭 Tag 时触发的事件 */
    signal closed();

    /*! 内边距 设置内容与外边框的间距*/
    property int   padding: 14;

    /*! 文本与关闭按钮间隔距离 */
    property int   spacing: 8;

    /*! 是否可关闭 */
    property bool  closable: false;

    /*! 是否可点击的 */
    property alias clickable: toou2d_tag.enabled;

    property alias label:   mlabel;

    property alias border:  mborder;

    property alias background: mbackground;

    property alias theme:   mtheme;

    cursorShape: Qt.ArrowCursor;

    width:  contentLayout.width  + padding;

    height: contentLayout.height + padding;

    TGadgetLabel{
        id:mlabel;
        text:  "Hi TTag"
        color: "#409EFF"
    }

    TGadgetBorder{
        id:mborder;
        width: 1;
        color: Qt.darker(mlabel.color,1.1)
    }

    TGadgetBackground{
        id:mbackground;
        radius: 2;
        color: "#ECF5FF"
    }

    TGadgetIcon{
        id:gicon;
        onSourceChanged: console.log("Warning: TTag The icon source cannot be set.")

        color: mlabel.color;
    }

    TRectangle{
        id:bgItem;
        anchors.fill: parent;
        theme.parent: mtheme;

        color: mbackground.color;

        radius:       mbackground.radius;
        border.width: mborder.width;
        border.color: mborder.color;
    }

    Row{
        id:contentLayout;
        anchors.centerIn: toou2d_tag;
        spacing: toou2d_tag.spacing;

        TLabel{
            id:content_label;
            anchors.verticalCenter: parent.verticalCenter;
            theme.childName: "label"
            theme.parent: mtheme;

            text:  mlabel.text;
            color: mlabel.color;
            font:  mlabel.font;
        }

        TIconButton{
            anchors.verticalCenter: parent.verticalCenter;
            theme.childName: "closebtn"
            theme.parent: mtheme;

            padding:   2
            visible:   toou2d_tag.closable;
            icon.width: 15;
            icon.height: 15;
            icon.color: gicon.color;
            icon.type: TIconType.SVG;
            icon.position: TPosition.Only;
            icon.source: "qrc:/net.toou.2d/resource/svg/close-px.svg"
            backgroundComponent: null;

            onClicked: toou2d_tag.closed();
        }
    }

    TThemeBinder{
        id:mtheme;
        className: "TTag"

        Component.onCompleted: initialize();
    }
}
