import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 8;

    TProgressBar{
        id:p1
        maxValue: 125;
        text: "$v - $max ($p%)"
    }

    TProgressBar{
        id:p2
        labelPosition: TPosition.Reght
        foreground.color: "#F36D6F"
        theme.groupName: "pb_green"
    }

    TProgressBar{
        id:p3
        maxValue: 66;
        labelPosition: TPosition.Center
        bakcground.height: 25
        foreground.color: "#6AC044"
        label.color: "#FFF"
        label.font.bold: true
        label.font.pixelSize: TPixelSizePreset.PH7
        theme.groupName: "pb_big"
    }

    Timer {
        interval: 300; running: true; repeat: true
        onTriggered:{
            p1.value += 5;
            p2.value += 5;
            p3.value += 5;

            if(p1.percentage === 1){
                p1.value = 0;
            }
            if(p2.percentage === 1){
                p2.value = 0;
            }
            if(p3.percentage === 1){
                p3.value = 0;
            }
        }
    }

}
