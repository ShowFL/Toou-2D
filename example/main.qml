import QtQuick 2.6
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import Toou2D 1.0
import "./qml"
Window {
    id:root
    visible: true
    width: 420
    height: 640
    title: "Beautiful new world - Toou2D  " + T2D.version();


    /***
      * T2DWorld是T2D框架中最重要的配置，
      * 虽然他现在的接口非常的少，但是没有它T2D将无法正常工作。
      ***/
    T2DWorld{
        globalTheme: "default";
        importThemePath: "qrc:/net.toou.2d/resource/";
    }

    Item{
        id:content;
        width: parent.width;
        height: parent.height;
        x:menubar.isopen ? 80 : 0;

        property string currentLabel: "Home";
        property string currentUrl: "qrc:/qml/Home.qml";

        Topbar{
            id:topbar;
            width: parent.width;
            height: 45;
            title: content.currentLabel;
            onShowMenubar:menubar.isopen = true;
        }

        Loader{
            id:page;
            width: parent.width;
            anchors.top:topbar.bottom;
            anchors.bottom: bottombar.top;
            source: content.currentUrl;

            Connections{
                target: page.item
                ignoreUnknownSignals:true;
                onBegin:menubar.isopen = true;
            }
        }

        Bottombar{
            id:bottombar
            width: parent.width;
            height: 45;
        }

        Behavior on x {
            NumberAnimation {
                duration: 100
            }
        }
    }

    MouseArea{
        anchors.fill: parent;
        enabled: menubar.isopen
        onClicked: {
            menubar.isopen = !menubar.isopen;
        }
    }

    Menubar{
        id:menubar;
        width: 160;
        height: parent.height;
        onTrigger: {
            content.currentLabel = label;
            content.currentUrl = url;
        }
    }

}
