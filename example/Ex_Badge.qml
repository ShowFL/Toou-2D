import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 15;

    Row{
        spacing: 40

        TButton{
            TBadge{
                id:b1;
                x:parent.width - width /2
                y:height / 2 * -1
            }

            onClicked:b1.value++;
        }

        TButton{
            TBadge{
                id:b2
                value: 100
                color: "#6ac044"
                x:parent.width - width /2
                y:height / 2 * -1
            }

            onClicked:b2.value++;
        }

        TButton{
            TBadge{
                id:b3
                value: 100
                max:99
                x:parent.width - width /2
                y:height / 2 * -1
            }

            onClicked:b3.value--;
        }

    }


}
