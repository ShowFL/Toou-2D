import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 20;

    TNavigationBar{
        width: 400;
        itemWidth: 60
        TNavigationElement{
            text: "User"
        }

        TNavigationElement{
            text: "Config"
        }

        TNavigationElement{
            text: "Role"
        }

        TNavigationElement{
            text: "Task"
        }

        children: [
            TDividerLine{
                width: parent.width;
                height: 1;
                color: "#DCDCDC"
                anchors.bottom: parent.bottom;
            }

        ]

    }


    TNavigationBar{
        id:nb
        width: 400;
        itemWidth: 90;

        activeLabel.color: "#F36D6F"
        activeIcon.color: "#F36D6F"

        TNavigationElement{
            iconSource: TAwesomeType.FA_apple;
            text: "Apple"
        }

        TNavigationElement{
            iconSource: TAwesomeType.FA_android;
            text: "Android"
        }

        TNavigationElement{
            iconSource: TAwesomeType.FA_github;
            text: "Github"
        }

        TNavigationElement{
            iconSource: TAwesomeType.FA_youtube;
            text: "Youtube"
        }

        children: [
            TDividerLine{
                anchors.bottom: parent.bottom;
                width:nb.currentItem.width;
                height: 2;
                x:nb.currentItem.x;
                color: "#DCDCDC"

                Behavior on x {
                    NumberAnimation {
                        easing.type: Easing.OutBack
                        duration: 100;
                    }
                }
            }
        ]
    }
}
