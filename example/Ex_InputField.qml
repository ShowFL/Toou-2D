import QtQuick 2.6
import Toou2D 1.0

Column{
    spacing: 10;
    Row{
        spacing: 30

        TInputField{
            width: 180;
            placeholderLabel.text: "Default Input"
        }

        TInputField{
            width: 180;
            placeholderIcon.source: TAwesomeType.FA_search
            placeholderLabel.text: "Icon Placeholder"
        }

    }


    Row{
        spacing: 30

        TInputField{
            width: 180;
            background.radius: height/2
            placeholderIcon.source: TAwesomeType.FA_pencil
            placeholderLabel.text: "Left Align"
            placeholderPosition: TPosition.Left;
        }

        TInputField{
            width: 180;
            background.radius: height/2
            placeholderIcon.source: TAwesomeType.FA_inbox
            text: "Clearn Input"
            clearable: true
        }

    }

}
