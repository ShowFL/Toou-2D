import QtQuick 2.6
import Toou2D 1.0

TMouseArea{
    id:button
    width: contentLoader.width + margin;
    height: contentLoader.height + margin;

    property int    margin: 20;
    property string text: "Button"
    property color color : theme.label_color;
    property alias theme: theme;
    property alias font: theme.font;

    property Component backgroundItem: Rectangle{
        enabled: false;
        scale: theme.scale;
        color: theme.bg_color;
        radius: theme.bg_radius;
        border.color: theme.border_color;
        border.width: theme.border_width;
    }

    property Component contentItem :Text {
        enabled: false;
        text: button.text;
        scale: theme.scale;
        anchors.centerIn: parent;
        color: button.color;
        font:  theme.font;
    }

    Loader{
        id:bgLoader;
        anchors.fill: button;
        sourceComponent: backgroundItem ;
        visible: theme.bg_visible;
    }

    Loader{
        id:contentLoader;
        sourceComponent: contentItem;
        anchors.centerIn: button;
        width:  item.width;
        height: item.height;
    }

    TThemeBinder{
        id:theme;
        type:"Button"
        state: button.state;

        property color  bg_color:     bindingColor("bg_color","#5d5d5d");
        property int    bg_radius:    bindingInt("bg_radius",0);
        property double bg_visible:   bindingBool("bg_visible",true);
        property color  border_color: bindingColor("border_color","#5d5d5d");
        property int    border_width: bindingInt("border_width",0);
        property color  label_color:  bindingColor("label_color","#000");
        property double scale:        bindingDouble("scale",1);
    }


}
