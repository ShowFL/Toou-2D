import QtQuick 2.0
import Toou2D 1.0

/*!todo*/
Item {
    id:toou2d_progressbar;

    width: content.width + padding;
    height: content.height + padding;

    /*!内边距填充大小*/
    property int padding: 6;

    property int spacing: 2;

    property int labelPosition: TPosition.Top;

    property double value: minValue;

    property double maxValue: 100;

    property double minValue: 0;

    property alias  label: mlabel;

    property alias  bakcground: mbg;

    property alias  foreground: mfg;


    /**显示的文本
    通配符含义：
    $p 百分比数值  例如：Loader $p%  即：Loader 50%
    $max 最大值
    $min 最小值
    $v   当前值
    */
    property alias text: mlabel.text;   //通用通配符 $p ,$max ,$min , $v

    property alias theme: mtheme;

    property Component bakcgroundComponent;

    property Component foregroundComponent;

    property Component labelComponent;

    readonly property double percentage: _private.percentage();

    readonly property alias  moveing: _private.moveing;

    bakcgroundComponent: TRectangle{
        width:  mbg.width;
        height: mbg.height;
        color:  mbg.color;
        radius: mbg.radius;
        theme.className: mtheme.className;
        theme.groupName: mtheme.groupName;
        theme.childName: "bg"
    }

    foregroundComponent: Item {
        width: mfg.width;
        height:mfg.height;
        TRectangle{
            theme.className: mtheme.className;
            theme.groupName: mtheme.groupName;
            theme.childName: "fg"
            height: parent.height;
            radius: mfg.radius;
            color:  mfg.color;
            width:  {
                var v = parent.width * _private.percentage();
                if(v < height) return height;
                return v;
            }

            Behavior on width {
                NumberAnimation {
                    duration: 300;
                    running: _private.moveing = running;
                }
            }
        }
    }

    labelComponent: TLabel{
        anchors.centerIn: parent;
        text: _private.format()
        color: mlabel.color;
        theme.parent: mtheme;
        theme.childName: "label";

        font:      mlabel.font;
        onContentWidthChanged: width = contentWidth > width ? contentWidth : width;
    }

    Item{
        id:content
        width:  cloader.width;
        height: cloader.height;
        anchors.centerIn: parent;
        Loader{
            id:cloader
            sourceComponent:{
                if(labelPosition === TPosition.Top)
                    return toplayout;
                else if(labelPosition === TPosition.Center)
                    return centerlayout;
                else if(labelPosition === TPosition.Reght || labelPosition === TPosition.Left)
                    return landrlayout;
                return null;
            }
        }
    }

    Component{
        id:toplayout
        Column{
            spacing: toou2d_progressbar.spacing;
            anchors.centerIn: parent;
            Loader{
                anchors.horizontalCenter: parent.horizontalCenter;
                sourceComponent: labelComponent;
            }
            Loader{
                id:bgloader;
                sourceComponent: bakcgroundComponent;
                anchors.horizontalCenter: parent.horizontalCenter;
                Loader{
                    z:1
                    anchors.fill: parent;
                    sourceComponent: foregroundComponent;
                }
            }
        }
    }

    Component{
        id:landrlayout;
        Row{
            spacing: toou2d_progressbar.spacing
            layoutDirection: labelPosition === TPosition.Reght ? Qt.LeftToRight : Qt.RightToLeft;
            Loader{
                id:bgloader;
                sourceComponent: bakcgroundComponent;
                anchors.verticalCenter:  parent.verticalCenter;
                Loader{
                    z:1
                    anchors.fill: parent;
                    sourceComponent: foregroundComponent;
                }
            }
            Loader{
                sourceComponent: labelComponent
            }
        }
    }

    Component{
        id:centerlayout
        Item{
            width: bgloader.width;
            height: Math.max(bgloader.height,labelt.height);
            Loader{
                id:bgloader;
                sourceComponent: bakcgroundComponent;
                anchors.verticalCenter: parent.verticalCenter;
                Loader{
                    z:1
                    anchors.fill: parent;
                    sourceComponent: foregroundComponent;
                }
            }

            Loader{
                id:labelt
                sourceComponent: labelComponent;
                anchors.verticalCenter: parent.verticalCenter;
                x:{
                    var nv = bgloader.width * percentage - width - 15;
                    if(nv < 5)
                        return 5;
                    return bgloader.width * percentage - width - 15;
                }
                Behavior on x {
                    NumberAnimation {
                        duration: 300;
                        running: _private.moveing = running;
                    }
                }
            }
        }

    }

    TObject{
        id:_private;
        property bool moveing: false;

        function percentage(){
            if(toou2d_progressbar.value >= toou2d_progressbar.maxValue){
                return 1;
            }
            else if(toou2d_progressbar.value <= 0){
                return 0;
            }

            return toou2d_progressbar.value / (toou2d_progressbar.maxValue - toou2d_progressbar.minValue);
        }

        function format(){
            var str =  mlabel.text;
            if(!str)return "";
            str = str.replace(/\$p/g, Math.floor(percentage() * 100));
            str = str.replace(/\$max/g, toou2d_progressbar.maxValue);
            str = str.replace(/\$min/g, toou2d_progressbar.minValue);
            str = str.replace(/\$v/g, toou2d_progressbar.value);
            return str;
        }
    }

    TGadgetBackground{
        id:mbg;
        color: "#EBEEF5"
        width: 300;
        height: 6;
        radius: height / 2;
    }

    TGadgetBackground{
        id:mfg;
        color: "#46A0FC"
        width: mbg.width;
        height: mbg.height;
        radius: height / 2;
    }

    TGadgetLabel{
        id:mlabel
        text: "$p%"
    }

    TThemeBinder{
        id:mtheme;
        className: "TProgressBar"

        Component.onCompleted: initialize();
    }

}
