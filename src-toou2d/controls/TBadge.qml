import QtQuick 2.6
import Toou2D 1.0

//! 徽标/角标
//    出现在按钮、图标旁的数字或状态标记。
//    必须携带value ,label不可以隐藏

//    TBadge{
//      value : 8
//    }
/*! TODO */
TRectangle {
    id:toou2d_badge;
    theme.className: "TBadge"

    property int  padding: 6;

    property int  value : 0;

    property int  max: 0;

    property alias label: gadget_label;

    radius: height / 2;

    color: "#F56C6C"

    border.width: 0;

    border.color: "#CB4C4C";

    width: {
        if(content_label.contentWidth + padding < height){
            return height;
        }
        return content_label.contentWidth + padding * 1.6;
    }

    height: {
        return padding + content_label.contentHeight;
    }

    TLabel{
        id:content_label;
        theme.childName: "label"
        theme.className:  toou2d_badge.theme.className;
        theme.state:      toou2d_badge.state;

        text:  gadget_label.text;
        color: gadget_label.color;
        font:  gadget_label.font;

        anchors.centerIn: parent;
    }

    TGadgetLabel{
        id:gadget_label;
        color: "#FFFFFF"
        text: {
            if(max > 0 && value > max)
                return max + "+";

            return value;
        }
    }
}
