pragma Singleton
import QtQuick 2.6
import Toou2D 1.0

/*!
    \qmltype TToast
    \since 5.9.x

    Often used as a feedback prompt after active operation. The difference with Notification is that the latter is more used as a passive reminder of system-level notifications.

    \code
    TToast.showSuccess(text,duration,moremsg);

    TToast.showInfo(text,duration,moremsg);

    TToast.showWarning(text,duration,moremsg);

    TToast.showError(text,duration,moremsg);

    TToast.showCustom(itemcomponent,duration);
    \endcode

    \sa {QtTest::TestCase}{TestCase}, {Qt Quick Test Reference Documentation}
*/

TObject {
    id:toou2d_toast;

    property int layoutY: 75;

    /*! duration = TTimePreset */
    function showSuccess(text,duration,moremsg){
        mcontrol.create(mcontrol.const_success,text,duration,moremsg ? moremsg : "");
    }

    function showInfo(text,duration,moremsg){
        mcontrol.create(mcontrol.const_info,text,duration,moremsg ? moremsg : "");
    }

    function showWarning(text,duration,moremsg){
        mcontrol.create(mcontrol.const_warning,text,duration,moremsg ? moremsg : "");
    }

    function showError(text,duration,moremsg){
        mcontrol.create(mcontrol.const_error,text,duration,moremsg ? moremsg : "");
    }

    function showCustom(itemcomponent,duration){
        mcontrol.createCustom(itemcomponent,duration);
    }

    TObject{
        id:mcontrol;
        property var root_window: _root_window_;
        property var screenLayout: null;

        property string const_success: "success";
        property string const_info:    "info";
        property string const_warning: "warning";
        property string const_error:   "error";

        property int maxWidth: 300;

        function create(type,text,duration,moremsg){
            if(screenLayout){
                var last = screenLayout.getLastloader();
                if(last.type === type && last.text === text && moremsg === last.moremsg){
                    last.restart();
                    return;
                }
            }

            initScreenLayout();
            contentComponent.createObject(screenLayout,{
                                              type:type,
                                              text:text,
                                              duration:duration,
                                              moremsg:moremsg,
                                          });
        }

        function createCustom(itemcomponent,duration){
            initScreenLayout();
            if(itemcomponent){
                contentComponent.createObject(screenLayout,{itemcomponent:itemcomponent,duration:duration});
            }
        }

        function initScreenLayout(){
            if(screenLayout == null){
                screenLayout = screenlayoutComponent.createObject(root_window);
                screenLayout.y = toou2d_toast.layoutY;
                screenLayout.z = 100000;
            }
        }

        Component{
            id:screenlayoutComponent
            Column{
                spacing: 20;
                width: parent.width;
                move: Transition {
                    NumberAnimation { properties: "y"; easing.type: Easing.OutBack; duration: 300 }
                }

                onChildrenChanged: if(children.length === 0)  destroy();

                function getLastloader(){
                    if(children.length > 0){
                        return children[children.length - 1];
                    }
                    return null;
                }
            }
        }

        Component{
            id:contentComponent
            Item{
                id:content;
                property int    duration: TTimePreset.ShortTime2s;
                property var    itemcomponent;
                property string type;
                property string text;
                property string moremsg;

                width:  parent.width;
                height: loader.height;

                function close(){
                    content.destroy();
                }

                function restart(){
                    delayTimer.restart();
                }

                Timer {
                    id:delayTimer
                    interval: duration; running: true; repeat: true
                    onTriggered: content.close();
                }

                Loader{
                    id:loader;
                    x:(parent.width - width) / 2;
                    property var _super: content;

                    scale: item ? 1 : 0;
                    asynchronous: true

                    Behavior on scale {
                        NumberAnimation {
                            easing.type: Easing.OutBack;
                            duration: 100
                        }
                    }

                    sourceComponent:itemcomponent ? itemcomponent : mcontrol.toou2d_sytle;
                }

            }
        }

        // -- Toou2D TMessage style
        property Component toou2d_sytle:  TRectangle{
            id:rect;
            width:  rowlayout.width  + (_super.moremsg ? 25 : 80);
            height: rowlayout.height + 20;
            color: {
                switch(_super.type){
                    case mcontrol.const_success: return "#F0F9EB";
                    case mcontrol.const_warning: return "#FDF6ED";
                    case mcontrol.const_info:    return "#EDF2FC";
                    case mcontrol.const_error:   return "#FEF0F0";
                }
                return "#FFFFFF"
            }
            radius: 4;
            border.width: 1;
            border.color: Qt.lighter(ticon.color,1.2);

            theme.parent: mtheme;
            theme.groupName: _super.type;
            theme.childName: "bg"

            Row{
                id:rowlayout
                x:20;
                y:(parent.height - height) / 2;
                spacing: 10
                TSVGIcon{
                    id:ticon
                    theme.parent: mtheme;
                    theme.groupName: rect.theme.groupName;
                    theme.childName: "content";

                    anchors.verticalCenter: parent.verticalCenter;
                    source:{
                        switch(_super.type){
                            case mcontrol.const_success: return "qrc:/net.toou.2d/resource/svg/success.svg";
                            case mcontrol.const_warning: return "qrc:/net.toou.2d/resource/svg/warning.svg";
                            case mcontrol.const_info:    return "qrc:/net.toou.2d/resource/svg/info.svg";
                            case mcontrol.const_error:   return "qrc:/net.toou.2d/resource/svg/error.svg";
                        }
                        return "#FFFFFF"
                    }

                    width:  more.visible ? 40 : 22;
                    height: more.visible ? 40 : 22;

                    color: {
                        switch(_super.type){
                            case mcontrol.const_success: return "#6AC044";
                            case mcontrol.const_warning: return "#E4A147";
                            case mcontrol.const_info:    return "#909399";
                            case mcontrol.const_error:   return "#F36D6F";
                        }
                        return "#FFFFFF"
                    }
                }

                Column{
                    spacing: 5;
                    TLabel{
                        theme.parent: mtheme;
                        theme.groupName: rect.theme.groupName;

                        font.bold:more.visible
                        font.pixelSize: 20;
                        text: _super.text
                        color: ticon.color;
                    }

                    TLabel{
                        id:more
                        theme.parent: mtheme;
                        theme.groupName: rect.theme.groupName;

                        color:    ticon.color;
                        text:    _super.moremsg;
                        visible: _super.moremsg;
                        wrapMode : Text.WordWrap

                        onContentWidthChanged: {
                            width = contentWidth < mcontrol.maxWidth - 100 ? 220 : mcontrol.maxWidth;
                        }
                    }
                }
            }

            TIconButton{
                theme.parent: mtheme;
                theme.childName: "btn.close"
                icon.width:  12;
                icon.height: 12;
                y:4; x:parent.width - width
                icon.type: TIconType.SVG;
                icon.position: TPosition.Only;
                icon.source: "qrc:/net.toou.2d/resource/svg/close-px.svg"
                icon.color:"#ADADAD";
                backgroundComponent: null;
                onClicked: _super.close();
            }

        }
        //style....end
    }

    TThemeBinder{
        id:mtheme;
        className: "TToast"

        Component.onCompleted: initialize();
    }

}
