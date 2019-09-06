import QtQuick 2.6
import Toou2D 1.0

// 对话框
//    在保留当前页面状态的情况下，告知用户并承载相关操作。
//    TDialog{

//    }
/*! TODO */
TDialogBasic {
    id:toou2d_dialog
    signal triggered(var button,var item);

    property string titleText : "Hello Toou2D";

    property string contentText: "This is the default message"

    property bool closeable: true

    property bool contentCenter: true;

    property int buttonSpacing: 15;

    property Component headerComponent;

    property Component footerComponent;

    default property Component contentComponent;

    property alias theme: mtheme;

    property list<TDialogButton> buttons;

    TObject{
        id:_mprivate;

        property var usercontentComponent;
        property list<TDialogButton> default_buttons:[
            TDialogButton{
                lighter: true
                label.text: "Enter"
                label.font.bold: true
                label.color: "#409EFF"
            }
        ]
    }

    contentComponent: Item{
        width: 240
        height: 30
        TLabel{
            text: contentText
            anchors.centerIn: parent;
            theme.parent: mtheme;
            theme.childName: "content.label"
        }
    }

    bodyComponent: TRectangle{
        theme.parent: mtheme

        width:  clayout.width + 10;
        height: clayout.height + 10;
        border.width: 1;
        border.color: "#DCDCDC"
        color: "#FFF"
        radius: 4

        Column{
            id:clayout
            anchors.centerIn: parent;
            spacing: 8;
            Loader{
                id:headerloader;
                sourceComponent: headerComponent;
            }

            Loader{
                id:contentloader;
                clip: true
                sourceComponent: contentComponent;
                onLoaded:_mprivate.usercontentComponent = item;
            }

            Loader{
                id:footerloader;
                sourceComponent: footerComponent;

                TDividerLine{
                    width: parent.width;
                    height: 1;
                    visible: footerComponent != null;
                    anchors.top: parent.top;
                    color: "#EFEFEF"

                    theme.parent: mtheme
                    theme.childName: "line"
                }
            }
            Component.onCompleted: {
                var maxwidth = Math.max(headerloader.width,contentloader.width,footerloader.width)
                headerloader.width  = maxwidth;
                contentloader.width = maxwidth;
                footerloader.width  = maxwidth;
            }
        }
    }

    headerComponent: Item{
        width: 260;
        height: label.height < 30 ? 30 : label.height;
        TLabel{
            id:label
            text: titleText
            x:toou2d_dialog.contentCenter ? (parent.width - width) / 2 : 20;
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true;
            font.pixelSize: TPixelSizePreset.PH5

            theme.parent: mtheme
            theme.childName: "titlabel"
        }

        TIconButton{
            padding: 10
            backgroundComponent: null;
            visible: toou2d_dialog.closeable;
            icon.type: TIconType.SVG
            icon.source: "qrc:/net.toou.2d/resource/svg/close-px.svg";
            icon.position: TPosition.Only;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            anchors.verticalCenter: parent.verticalCenter;
            onClicked: {
                toou2d_dialog.hideAndClose();
                closed();
            }

            theme.parent: mtheme
            theme.childName: "closebtn"
        }
    }

    footerComponent: Item{
        id:_footer
        width:  layout.width;
        height: layout.height + 6;
        property var md: buttons.length > 0 ? buttons : _mprivate.default_buttons;
        Row{
            id:layout
            spacing: toou2d_dialog.contentCenter ? 1 : buttonSpacing;
            x:toou2d_dialog.contentCenter ? (parent.width - width) / 2 : parent.width - 10 - width;
            anchors.verticalCenter: parent.verticalCenter;
            Repeater{
                model: md
                delegate: TIconButton{
                    width: toou2d_dialog.contentCenter ? _footer.width / md.length : 80;
                    padding: 20
                    backgroundComponent: null;
                    theme.state: modelData.lighter ? "btnlighter" : "none"; //parent state? mtheme.state ?
                    theme.className: "TDialog"
                    theme.childName: "btn"

                    label.text:  modelData.label.text;
                    label.font:  modelData.label.font;
                    label.color: modelData.label.color;
                    icon.type:   modelData.icon.type;
                    icon.source: modelData.icon.source;
                    icon.width:  modelData.icon.width;
                    icon.height: modelData.icon.height;
                    icon.color:  modelData.icon.color;
                    anchors.verticalCenter: parent.verticalCenter;
                    onClicked: triggered(modelData,_mprivate.usercontentComponent);
                }
            }
        }

        Repeater{
            model: md.length - 1;
            delegate: TDividerLine{
                anchors.verticalCenter: parent.verticalCenter;
                height: _footer.height * 0.8;
                width: 1;
                color: "#EFEFEF"
                x:(index + 1) * (_footer.width / md.length)
                visible: toou2d_dialog.contentCenter;

                theme.parent: mtheme
                theme.childName: "line"
            }
        }
    }

    TThemeBinder{
        id:mtheme;
        className: "TDialog";

        Component.onCompleted: initialize();
    }
}
