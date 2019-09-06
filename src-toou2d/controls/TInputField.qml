import QtQuick 2.6
import Toou2D 1.0

//带有图标的输入框,兼容Qt原生全部特性。通过鼠标或键盘输入字符
/*! TODO */
Item{

    id:toou2d_textinput

    width: 160;
    height: 38;

    signal cleared();

    property alias inputing: input.focus;

    property int   verticalMargin: 5;

    property int   horizontalMargin : verticalMargin + (background.radius >= height / 2 ? 10 : 5);

    property int   placeholderPosition: TPosition.Center;

    property int   placeholderSpacing: 10;

    property alias placeholderLabel: mplaceholderLabel;

    property alias placeholderIcon:  micon;

    property bool  clearable:  true;

    property alias clearIcon: mclear;

    property alias background: mbackground;

    property alias border: mborder;

    property alias label: mlabel;

    property alias theme: mtheme;

    property Component cursorDelegate;

    property color cursorColor: "#000000"

    property alias acceptableInput: input.acceptableInput;

    property alias activeFocusOnPress: input.activeFocusOnPress;

    property alias canPaste: input.canPaste;

    property alias canRedo:  input.canRedo;

    property alias canUndo:  input.canUndo;

    property alias echoMode: input.echoMode;

    property alias inputMask : input.inputMask;

    property alias inputMethodComposing : input.inputMethodComposing;

    property alias inputMethodHints : input.inputMethodHints;

    property alias length : input.length;

    property alias maximumLength  : input.maximumLength;

    property alias selectByMouse  : input.selectByMouse;

    property alias selectedText   : input.selectedText;

    property alias selectionEnd   : input.selectionEnd;

    property alias selectionStart : input.selectionStart;

    property alias text   : input.text;

    property alias qtInput: input;

    state: inputing ? "inputing" : "none";

    clip: true
    TGadgetBackground{
        id:mbackground;
        color: "#FCFCFC"
        radius: 2
    }

    TGadgetLabel{
        id:mplaceholderLabel
        text: "TInputField"
        color: "#9D9D9D"
    }

    TGadgetLabel{
        id:mlabel;
    }

    TGadgetIcon{
        id:micon
        color: "#9D9D9D"
    }

    TGadgetIcon{
        id:mclear
        color: border.color
        width: 12;
        height:12;
        source: "qrc:/net.toou.2d/resource/svg/close-px.svg"
    }

    TGadgetBorder{
        id:mborder
        width: 1;
        color: "#9D9D9D"
    }

    TRectangle{
        anchors.fill: parent;
        border.width: mborder.width;
        border.color: mborder.color;
        color:  mbackground.color;
        radius: mbackground.radius;
        opacity:mbackground.opacity;

        theme.parent: mtheme;
        theme.childName: "bg";
    }

    TObject{
        id:_private;
        property bool hold: input.focus || input.length > 0 || placeholderPosition === TPosition.Left;
    }

    cursorDelegate:TDividerLine{
        id:cursor
        color:  toou2d_textinput.cursorColor;
        width:  1;
        height: input.contentHeight
        visible:false
        Timer {
            interval: 500; running: input.focus; repeat: true
            onTriggered: cursor.visible = !cursor.visible;
            onRunningChanged: !running ? cursor.visible = false : false;
        }

        theme.parent: mtheme;
        theme.childName: "cursor";
    }

    TextInput{
        id:input;
        clip: true
        anchors.fill: parent;
        color: mlabel.color;
        verticalAlignment:   TextInput.AlignVCenter;
        cursorDelegate:      toou2d_textinput.cursorDelegate;
        anchors.topMargin:   toou2d_textinput.verticalMargin;
        anchors.bottomMargin:toou2d_textinput.verticalMargin;
        anchors.rightMargin: {
            if(clearable && clearbtn.visible) return clearbtn.width;
            return toou2d_textinput.horizontalMargin;
        }

        anchors.leftMargin:  {
            if(_private.hold)
                return placeholder.leftPadding;
            return toou2d_textinput.horizontalMargin;
        }

        Keys.onReleased: input.focus = event.key !== Qt.Key_Escape
    }

    Row{
        id:placeholder
        spacing: 4
        opacity: 0.7
        x: input.focus || input.length > 0 ? holdX : startX;
        anchors.verticalCenter: parent.verticalCenter;
        property int holdX: toou2d_textinput.horizontalMargin;
        property int leftPadding: {
            if(!iconloader.visible && background.radius >= toou2d_textinput.height / 2){
                return horizontalMargin;
            }
            return iconloader.width + spacing / 2 + x;
        }

        property int startX:{
            if(placeholderPosition !== TPosition.Left){
                return (parent.width - width) / 2;
            }
            return holdX;
        }

        Loader{
            id:iconloader;
            visible: sourceComponent !== null;
            anchors.verticalCenter: parent.verticalCenter
            sourceComponent: {
                if(!micon.source)
                    return null;
                else if(micon.type === TIconType.SVG || micon.source.indexOf(".svg") != -1){
                    return svgComponent;
                }
                return awesomeiconComponent;
            }
        }

        Behavior on x {
            NumberAnimation {
                duration: 100
                onRunningChanged: ptext.vout = running;
            }
        }

        TLabel{
            id:ptext
            text: mplaceholderLabel.text;
            color: mplaceholderLabel.color;
            font.pixelSize: mplaceholderLabel.font.pixelSize;
            font.bold: mplaceholderLabel.font.bold;

            theme.parent: mtheme;
            theme.childName: "placeholder.label";

            property bool vout;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.verticalCenterOffset: {
                    vout;
                if(!vout && input.focus || input.length > 0){
                    return -50;
                }
                return 0;
            }

            Behavior on anchors.verticalCenterOffset {
                NumberAnimation {
                    duration: 200
                }
            }
        }
    }

    TIconButton{
        id:clearbtn;
        backgroundComponent: null;
        padding: 15;
        takeFocus:false;
        icon.position: TPosition.Only
        icon.width:  mclear.width;
        icon.height: mclear.height;
        icon.color:  mclear.color;
        icon.source: mclear.source;
        anchors.right: parent.right;
        anchors.verticalCenter: parent.verticalCenter;
        visible: clearable && input.length > 0;
        onClicked: input.text = ""

        theme.parent: mtheme;
        theme.childName: "btn.clear"
    }

    Component{
        id:awesomeiconComponent
        TAwesomeIcon{
            enabled: false;
            theme.childName: "placeholder.icon"
            theme.parent: mtheme;

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
            theme.childName: "placeholder.icon"
            theme.parent: mtheme;

            source: micon.source;
            color:  micon.color;
            width:  micon.width;
            height: micon.height;
        }
    }

    TThemeBinder{
        id:mtheme
        className: "TInputField";
        state: toou2d_textinput.state;

        property alias inputTextColor: input.color;
        property alias width:  toou2d_textinput.width;
        property alias height: toou2d_textinput.height;

        Component.onCompleted: initialize();
    }
}
