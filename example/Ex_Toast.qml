import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 20;

    TRectangle{
        id:rect4
        width:  360;
        height: 80;
        color: {
            switch("const_error"){
            case "const_success": return "#F0F9EB";
            case "const_warning": return "#FDF6ED";
            case "const_info":    return "#EDF2FC";
            case "const_error":   return "#FEF0F0";
            }
            return "#FFFFFF"
        }
        radius: 4;
        border.width: 1;
        border.color: Qt.lighter(ticon4.color,1.2);

        theme.className: "TToast"
        theme.groupName: "";
        theme.childName: "bg"

        Row{
            x:20;
            y:(parent.height - height) / 2;
            spacing: 10
            TSVGIcon{
                id:ticon4
                theme.className:rect4.theme.className;
                theme.groupName: rect4.theme.groupName;
                theme.childName: "icon";
                anchors.verticalCenter: parent.verticalCenter;
                source:{
                    switch("const_info"){
                    case "const_success": return "qrc:/net.toou.2d/resource/svg/success.svg";
                    case "const_warning": return "qrc:/net.toou.2d/resource/svg/warning.svg";
                    case "const_info":    return "qrc:/net.toou.2d/resource/svg/info.svg";
                    case "const_error":   return "qrc:/net.toou.2d/resource/svg/error.svg";
                    }
                    return "#FFFFFF"
                }

                width:  more4.visible ? 40 : 22;
                height: more4.visible ? 40 : 22;

                color: {
                    switch("const_error"){
                    case "const_success": return "#6AC044";
                    case "const_warning": return "#E4A147";
                    case "const_info":    return "#909399";
                    case "const_error":   return "#F36D6F";
                    }
                    return "#FFFFFF"
                }
            }

            Column{
                spacing: 5;
                TLabel{
                    theme.className:rect4.theme.className;
                    theme.groupName: rect4.theme.groupName;
                    theme.childName: "label";
                    font.bold:more4.visible
                    font.pixelSize: 20;
                    text: "Error"
                    color: ticon4.color;
                }

                TLabel{
                    id:more4

                    theme.className:rect4.theme.className;
                    theme.groupName: rect4.theme.groupName;
                    theme.childName: "label";

                    color:    ticon4.color;
                    text:    "User name error\nPassword length error";
                    wrapMode : Text.WordWrap

                    onContentWidthChanged: {
                        width = contentWidth <300 - 100 ? 220 : 300;
                    }
                }
            }
        }

        TIconButton{
            theme.enabled: false;
            icon.width:  12;
            icon.height: 12;
            y:4; x:parent.width - width
            icon.type: TIconType.SVG;
            icon.position: TPosition.Only;
            icon.source: "qrc:/net.toou.2d/resource/svg/close-px.svg"
            icon.color:"#ADADAD";
            backgroundComponent: null;
        }

    }

    Row{
        height: 30;
        TButton{
            backgroundComponent: null;
            theme.groupName: "demo-popdialog"
            label.text: "Show Success"
            label.color:  "#46A0FC"
            onClicked: {
                TToast.showSuccess("Welcome to Toou2D",TTimePreset.LongTime4s,"No discord, no concord.");
            }
        }

        TButton{
            backgroundComponent: null;
            theme.groupName: "demo-popdialog"
            label.text: "Show Warning"
            label.color:  "#46A0FC"
            onClicked: TToast.showWarning("Welcome to Toou2D",TTimePreset.ShortTime2s);
        }

        TButton{
            backgroundComponent: null;
            theme.groupName: "demo-popdialog"
            label.text: "Show Info"
            label.color:  "#46A0FC"
            onClicked: TToast.showInfo("Welcome to Toou2D",TTimePreset.ShortTime2s);
        }

        TButton{
            backgroundComponent: null;
            theme.groupName: "demo-popdialog"
            label.text: "Show Error"
            label.color:  "#46A0FC"
            onClicked: TToast.showError("Welcome to Toou2D",TTimePreset.ShortTime2s);
        }
    }

    TLabel{
        text: "( Theme! For real effects, please click to show)"
        anchors.horizontalCenter: parent.horizontalCenter;
    }
}
