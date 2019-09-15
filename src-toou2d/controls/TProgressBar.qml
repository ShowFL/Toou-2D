import QtQuick 2.0
import Toou2D 1.0

/*!todo*/
Item {
    id:toou2d_progressbar;
    clip: true
    width: 300; height: 10;

    property double value : 0;

    property double maxValue: 100;

    property double startValue: 0;

    property alias  background: mbackground;

    property alias  foreground: mforeground;

    property Component maskComponent: null;

    property Component backgroundComponent;

    //通过percentage可以自定义动画行为
    property Component foregroundComponent;

    /**显示的文本，格式化通配符含义：
        $p 百分比数值  ，$max 最大值，$s   启始值，$v   当前值
        例如：loader $p%  即：loader 50%
        */
    property string format:"loading $p %";

    property alias theme: mtheme;

    readonly property double percentage: _private.percentage();

    //获得格式化后的文本
    readonly property string formatText : _private.format();

    Loader{
        id:barbg;
        anchors.fill: parent;
        sourceComponent: backgroundComponent;

        Loader{
            width:  parent.width;
            height: parent.height;
            sourceComponent: foregroundComponent;
            z:1
        }
    }

    backgroundComponent: TRectangle{
        color:  mbackground.color;
        radius: mbackground.radius;
        theme.filterPropertyName: ["width","height"];
        theme.childName: "bg"
        theme.parent: mtheme;
    }

    foregroundComponent: TRectangle{
        theme.parent: mtheme;
        color:  mforeground.color;
        radius: mforeground.radius ;
        theme.filterPropertyName: ["width","height"];
        theme.childName: "fg"

        x:width * (1 - toou2d_progressbar.percentage) * -1;

        Behavior on x {
            id:behavior
            enabled: false;
            NumberAnimation {
                duration: 200
            }
        }
        Timer {
            interval: 20; running: true;
            onTriggered: behavior.enabled = true;
        }
    }

    maskComponent: Rectangle{
        width:  barbg.width;
        height: barbg.height;
        radius: mbackground.radius;
    }

    Loader{
        id:mask
        sourceComponent:maskComponent;
    }

    TMask{
        anchors.fill: parent;
        sourceItem: barbg;
        maskItem:   mask;
    }

    TObject{
        id:_private;
        property bool moveing: false;

        function percentage(){
            var cv = toou2d_progressbar.value + toou2d_progressbar.startValue;
            if(toou2d_progressbar.maxValue <= 0 || cv <= 0){
                return 0;
            }
            else if(cv >= toou2d_progressbar.maxValue){
                return 1;
            }
            return cv / toou2d_progressbar.maxValue;
        }

        function format(){
            var str =  toou2d_progressbar.format;
            if(!str)return "";
            str = str.replace(/\$p/g, Math.floor(percentage() * 100));
            str = str.replace(/\$max/g, toou2d_progressbar.maxValue);
            str = str.replace(/\$s/g, toou2d_progressbar.startValue);
            str = str.replace(/\$v/g, toou2d_progressbar.value);
            return str;
        }
    }

    TGadgetBackground{
        id:mbackground;
        color: "#EBEEF5"
        width:  toou2d_progressbar.width;
        height: toou2d_progressbar.height;
        radius: height / 2;
    }

    TGadgetBackground{
        id:mforeground;
        color: "#46A0FC"
        width:  toou2d_progressbar.width;
        height: toou2d_progressbar.height;
        radius: height / 2;
    }

    TThemeBinder{
        id:mtheme;
        className: "TProgressBar"

        Component.onCompleted: initialize();
    }

}
