import QtQuick 2.6
import Toou2D 1.0

/*!
    \qmltype TAwesomeIcon
    \inqmlmodule QtQuick 2.6
    \brief Font Icon
    \since 5.9.x
    \ingroup qtquicktest

    has been supported to the latest version

    \code
    TAwesomeIcon{
        source:T2D.FA_apple
    }
    \endcode

    Theme ini file is configured to 'FA_apple'.
*/
Item {
    id:toou2d_awesomeicon
    width:  16;
    height: 16;

    property color  color;

    /*! \sa TAwesomeType */
    property string source;

    property alias  theme: mtheme;

    Text {
        id:content_text
        anchors.fill: parent;
        enabled:          false;
        color:            toou2d_awesomeicon.color;
        font.family:      "fontawesome"
        font.pixelSize:   Math.max(toou2d_awesomeicon.width,toou2d_awesomeicon.height);
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment:   Text.AlignVCenter;
    }

    TThemeBinder{
        id:mtheme
        className: "TAwesomeIcon";
        state:toou2d_awesomeicon.state;

        property alias color:  toou2d_awesomeicon.color;
        property alias source: toou2d_awesomeicon.source;
        property alias width:  toou2d_awesomeicon.width;
        property alias height: toou2d_awesomeicon.height;

        Component.onCompleted: initialize();
    }

    TObject{
        id:wrapper;
        property alias source: toou2d_awesomeicon.source;
        onSourceChanged: {
            if(source.indexOf("FA") === 0){
                content_text.text = T2D.awesomeFromKey(source);
            }else if(source.charAt(0) !== "\\"){
                content_text.text = T2D.awesomeFromValue(source);
            }else{
                content_text.text = source;
            }
        }
    }

}
