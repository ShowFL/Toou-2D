import QtQuick 2.0
import Toou2D 1.0

Item {
    id:toou_mask;

    property alias sourceItem : msource.sourceItem;

    property alias maskItem : mmask.sourceItem;

    property bool smooth: true;

    property bool hideSource: true;

    property bool live: true;

    ShaderEffectSource {
        id: msource
        live: toou_mask.live;
        visible:    false
        hideSource: toou_mask.hideSource;
        smooth:     toou_mask.smooth;
        sourceItem: sourceItem
    }

    ShaderEffectSource {
        id: mmask
        live: toou_mask.live;
        visible:    false
        hideSource: toou_mask.hideSource;
        smooth:     toou_mask.smooth;
        sourceItem: maskItem
    }

    ShaderEffect {
        id: shaderItem
        anchors.fill: parent;
        property variant source: msource
        property variant maskSource: mmask
        fragmentShader: "qrc:/net.toou.2d/resource/font/mask.cso"
    }

}
