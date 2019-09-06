import QtQuick 2.6
import Toou2D 1.0

Column{
    spacing: 10;

    Row{
        height: 40;
        spacing: 10

        TIconButton{
            label.text: "Primary"
            label.color: "#FFF"
            label.font.bold: true;
            background.color: "#46A0FC"
            icon.source: TAwesomeType.FA_apple;
            icon.color:label.color;
            theme.enabled: false;
        }

        TIconButton{
            label.text: "Success"
            label.font.bold: true;
            label.color: "#FFF"
            background.color: "#6AC044"
            icon.source: TAwesomeType.FA_android;
            icon.color:label.color;
            theme.enabled: false;
        }

        TIconButton{
            label.text: "Warning"
            label.font.bold: true;
            label.color: "#FFF"
            background.color: "#E4A147"
            icon.source: TAwesomeType.FA_github;
            icon.color:label.color;
            theme.enabled: false;
        }

        TIconButton{
            label.text: "Danger"
            label.font.bold: true;
            label.color: "#FFF"
            background.color: "#F36D6F"
            icon.source: TAwesomeType.FA_pencil;
            icon.color:label.color;
            theme.enabled: false;
        }
    }

    Row{
        height: 40;
        spacing: 10
        TIconButton{
            icon.position: TPosition.Only;
            icon.source: TAwesomeType.FA_apple;
            background.radius: height / 2;
        }

        TIconButton{
            icon.position: TPosition.Only;
            icon.source: TAwesomeType.FA_android;
            icon.color: "#46A0FC"
            background.color: "#ECF5FF"
            border.color: "#46A0FC"
            background.radius: height / 2;
            theme.enabled: false;
        }

        TIconButton{
            icon.position: TPosition.Only;
            icon.source: TAwesomeType.FA_windows;
            icon.color: "#6AC044"
            background.color: "#F0F9EB"
            border.color: "#6AC044"
            background.radius: height / 2;
            theme.enabled: false;
        }

        TIconButton{
            icon.position: TPosition.Only;
            icon.source: TAwesomeType.FA_github;
            icon.color: "#E4A147"
            background.color: "#FDF6ED"
            border.color: "#E4A147"
            background.radius: height / 2;
            theme.enabled: false;
        }

        TIconButton{
            icon.position: TPosition.Only;
            icon.source: TAwesomeType.FA_star_o;
            icon.color: "#F36D6F"
            background.color: "#FEF0F0"
            border.color: "#F36D6F"
            background.radius: height / 2;
            theme.enabled: false;
        }
    }
}

