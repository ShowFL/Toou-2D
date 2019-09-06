import QtQuick 2.0
import Toou2D 1.0

Column{
    spacing: 10;
    Row{
        spacing: 30

        Column{

            TLabel{
                text:"Typography"
                font.pixelSize: TPixelSizePreset.PH1
            }
            TLabel{
                text: "Heading1"
                font.pixelSize: TPixelSizePreset.PH1
            }
            TLabel{
                text: "Heading2"
                font.pixelSize: TPixelSizePreset.PH2
            }
            TLabel{
                text: "Heading3"
                font.pixelSize: TPixelSizePreset.PH3
            }
            TLabel{
                text: "Heading4"
                font.pixelSize: TPixelSizePreset.PH4
            }
            TLabel{
                text: "Heading5"
                font.pixelSize: TPixelSizePreset.PH5
            }
            TLabel{
                text: "Heading6"
                font.pixelSize: TPixelSizePreset.PH6
            }
        }

        Column{
            spacing: 15
            TLabel{
                text:"Example body text"
                font.pixelSize: TPixelSizePreset.PH2
            }
            TLabel{
                wrapMode :Text.WordWrap;
                width: 170;
                text:"With Toou2D becoming more popular every day, there is the constant need to be different. There are millions of users. If Toou2D layouts are chosen well, then you can enhance your profile a great deal."
            }
        }
    }
}

