import QtQuick 2.6
import Toou2D 1.0

TMouseArea{
    id:button

    property alias theme: theme;
    property string source: theme.source;

    property Component contentItem: Image {
        source: button.source;
    }

    Loader{
        id:contentLoader;
        scale:theme.scale;
        sourceComponent: contentItem;
        anchors.fill: parent;
        onItemChanged: {
            if(button.width == 0 || button.height == 0){
                button.width = item.sourceSize.width;
                button.height = item.sourceSize.height;
            }
        }
    }

    TThemeBinder{
        id:theme
        type:"ImageButton"
        state: button.state;
        property string source: bindingString("source","");
        property double scale: bindingDouble("scale",1);
    }

}
