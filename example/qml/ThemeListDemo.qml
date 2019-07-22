import QtQuick 2.0
import Toou2D 1.0

TRectangle {
    id:page;
    clip: true;
    theme.className: "themelistbg"
    ListView{
        id:listView;
        spacing: 30;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.topMargin: 10;
        anchors.bottomMargin: 10;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: 400;
        model: TThemeManager.themeList;

        delegate: TRectangle{
            theme.className: "themelistborder"
            width: listView.width;
            height: 250;
            radius: 2;

            TRectangle{
                id:sampleRect;
                anchors.horizontalCenter: parent.horizontalCenter;
                width: parent.width - 20;
                anchors.top: parent.top;
                anchors.topMargin: 10;
                height: 180;
                theme.enabled: false;

                Image {
                    id: name
                    source: modelData.sample
                }
            }

            Item{
                anchors.left: sampleRect.left;
                anchors.right: sampleRect.right;
                anchors.top: sampleRect.bottom;
                anchors.bottom: parent.bottom;

                TIconButton{
                    property bool isLiked: false;
                    theme.className: "like"
                    anchors.left: parent.left;
                    anchors.verticalCenter: parent.verticalCenter;
                    iconSource: isLiked ? T2D.FA_thumbs_up : T2D.FA_thumbs_o_up
                    iconLayout: T2D.IconLeft
                    text: "Like"
                    hoverEnabled: true;
                    onClicked: isLiked = !isLiked;
                }

                TButton{
                    theme.className: "royal"
                    anchors.right: parent.right;
                    anchors.verticalCenter: parent.verticalCenter;
                    text: "Use this theme now"
                    visible: TThemeManager.globalTheme !== modelData.name;
                    onClicked: TThemeManager.globalTheme = modelData.name;
                }
            }
        }
    }

}
