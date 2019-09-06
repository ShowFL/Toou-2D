import QtQuick 2.6
import Toou2D 1.0

/* https://www.iconfont.cn
    svg 是一种比较流行的icon 源。
    默认是异步加载的,可提高性能。
    因为需要寻找svg资源，这点没有AwesomeIcon 方便。
*/
/*! TODO */
Item {
    id:toou2d_svgicon
    width:  16; height: 16;

    property bool   asynchronous : true;

    property bool   smooth: true;

    property color  color;

    property string source;

    property alias theme: toou2d_svgicon_theme;

    Image {
        id:image
        asynchronous: toou2d_svgicon.asynchronous;
        anchors.fill: toou2d_svgicon;
        source:  toou2d_svgicon.source;
        smooth: toou2d_svgicon.smooth
        visible: false;
        enabled: false;
    }

    ShaderEffect {
        id: shaderItem
        property variant source: image
        property color   color: toou2d_svgicon.color
        enabled: false;
        fragmentShader: "qrc:/net.toou.2d/resource/font/svg.cso"
        anchors.fill: parent
    }

    TThemeBinder{
        id:toou2d_svgicon_theme
        className: "TSVGIcon";
        state:toou2d_svgicon.state;

        property alias color:  toou2d_svgicon.color;
        property alias source: toou2d_svgicon.source;
        property alias width:  toou2d_svgicon.width;
        property alias height: toou2d_svgicon.height;

        Component.onCompleted: initialize();
    }
}
