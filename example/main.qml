import QtQuick 2.6
import QtQuick.Window 2.2
import Toou2D 1.0

Window {
    id:rootwindow
    visible: true
    width: 480
    height: 700

    /***
      * T2DWorld是T2D框架中最重要的配置
      ***/
    T2DWorld{
        //appStartupTheme: "Solarized"
        appThemePaths: [
            "qrc:/themes/"
        ]
    }

    TRectangle{
        width: parent.width;
        height: parent.height;
        color: "#FFF"
        x:menu.isopen ? 90 : 0;
        Topbar{
            id:topbar;
            width: parent.width;
            height: 45;
            onShowMenu: menu.open();
        }


        Loader{
            id:pageloader;

            anchors{
                left:  parent.left;
                right: parent.right;
                top:   topbar.bottom;
                bottom: footerbar.top;
            }
            source: "qrc:/Home.qml"


            function begin(){
                menu.open();
            }

            function toPage(uri,title){
                source = uri;
                topbar.title = title;
            }

        }

        Menubar{
            id:menu
            width: 160;
            height: rootwindow.height;
            onTopage: {
                if(title === "Github" || title === "Api doc"){
                    Qt.openUrlExternally(uri);
                }else{
                    pageloader.toPage(uri,title);
                }
            }
        }

        Footerbar{
            id:footerbar
            width: parent.width;
            height: 45;
            anchors.bottom: parent.bottom;
        }

        Behavior on x {
            NumberAnimation {
                duration: 100
            }
        }

    }

    Component.onCompleted: {
        TToast.layoutY = 20;
    }

}
