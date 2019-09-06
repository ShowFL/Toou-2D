import QtQuick 2.0
import Toou2D 1.0

//只能iocn,根据source来判断选择使用TAwesomelIcon 或者 TSVGIcon*/
/*! TODO */
Item {
    id:toou2d_icon
    property alias theme: mtheme;

    property string source;
    property color  color;

    Loader{
        anchors.fill: parent;
        sourceComponent: {
            if(toou2d_icon.source.toLowerCase().indexOf(".svg") !== -1){
                return svgComponent;
            }
            return awesomeiconComponent;
        }
    }

    Component{
        id:awesomeiconComponent
        TAwesomeIcon{
            enabled: false;
            theme.enabled: false;

            source: toou2d_icon.source;
            color:  toou2d_icon.color;
        }
    }

    Component{
        id:svgComponent
        TSVGIcon{
            enabled: false;
            theme.enabled: false;

            source: toou2d_icon.source;
            color:  toou2d_icon.color;
        }
    }

    TThemeBinder{
        id:mtheme;
        className: "TIcon";
        state: toou2d_icon.state;
        property alias source: toou2d_icon.source;
        property alias color:  toou2d_icon.color;
        property alias width:  toou2d_icon.width;
        property alias height: toou2d_icon.height;

        Component.onCompleted: initialize();
    }
}
