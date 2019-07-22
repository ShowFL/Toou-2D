import QtQuick 2.6
import Toou2D 1.0

Item {
    width: 16;
    height: 16;

    property alias theme: theme;
    property alias color: content.color;
    property alias source: theme.source;

    Text {
        id:content
        font.family: "fontawesome"
        anchors.centerIn: parent;
        font.pixelSize: Math.min(parent.width,parent.height);
        enabled: false;
        color: theme.color;
    }


    TThemeBinder{
        id:theme;

        type:"AwesomeIcon";

        property color  color:  bindingColor("color","#5d5d5d");
        property string source: bindingString("source","");

        onSourceChanged: {
            if(source.indexOf("FA") === 0){
                content.text = T2D.awesomeFromKey(source);
            }else if(source.charAt(0) !== "\\"){
                content.text = T2D.awesomeFromValue(source);
            }else{
                content.text = source;
            }
        }
    }
}
