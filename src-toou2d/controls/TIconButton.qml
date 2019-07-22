import QtQuick 2.6
import Toou2D 1.0
import QtQuick.Layouts 1.3

TButton {
    id:button
    theme.type: "IconButton"

    property alias iconTheme: iconTheme;

    property int iconLayout : T2D.IconOnly;
    property int spacing: 5;
    property int iconSize: 22;

    property string iconSource: iconTheme.icon_source;
    property color iconColor: iconTheme.icon_color;

    contentItem: Loader{
        sourceComponent: {
            if(iconLayout == T2D.IconOnly){
                return contentIconOnlyItem;
            }
            else if(iconLayout == T2D.IconLeft || iconLayout == T2D.IconReght){
                return contentRowLayoutItem;
            }
            else if(iconLayout == T2D.IconTop){
                return contentColumnLayoutItem;
            }
            return null;
        }
    }

    property Component contentIconOnlyItem: TAwesomeIcon{
        source: button.iconSource;
        color: button.iconColor;
        width: iconSize;
        height: iconSize;
        theme.enabled: false;
    }

    property Component contentRowLayoutItem: RowLayout{
        spacing: button.spacing
        layoutDirection: iconLayout == T2D.IconLeft ? Qt.LeftToRight : Qt.RightToLeft;
        TAwesomeIcon{
            source: button.iconSource;
            color:button.iconColor;
            width: iconSize;
            height: iconSize;
            theme.enabled: false;
        }

        Text {
            text: button.text;
            font: button.theme.font;
            color: button.theme.label_color;
        }
    }

    property Component contentColumnLayoutItem: ColumnLayout{
        spacing: button.spacing;
        TAwesomeIcon{
            source: button.iconSource;
            color: button.iconColor;

            width: iconSize;
            height: iconSize;
            theme.enabled: false;
            Layout.alignment: Qt.AlignHCenter;
        }

        Text {
            text: button.text;
            font: button.theme.font;
            color: button.theme.label_color;
            Layout.alignment: Qt.AlignHCenter;
        }
    }

    TThemeBinder{
        id:iconTheme;
        type:"IconButton"
        property color icon_color: bindingColor("icon_color","#5d5d5d");
        property string icon_source: bindingString("icon_source","");
    }
}
