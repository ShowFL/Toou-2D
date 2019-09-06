import QtQuick 2.0
import Toou2D 1.0

Column{
    width: parent.width
    spacing: 15;

    Row{
        id:layout
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        TTag{
            label.text: "Tag One"
        }

        TTag{
            label.text: "Tag Two"
            label.color: "#6AC044"
            background.color: "#F0F9EB"
            border.color: "#6AC044"
        }

        TTag{
            label.text: "Tag Three"
            label.color: "#E4A147"
            background.color: "#FDF6ED"
            border.color: "#E4A147"
        }

        TTag{
            label.text: "Tag Four"
            label.color: "#F36D6F"
            background.color: "#FEF0F0"
            border.color: "#F36D6F"
        }
    }


    Row{
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        TTag{
            label.text: "Tag One"
            closable: true
            background.radius: 10
            onClosed: visible = false;
        }

        TTag{
            closable: true
            background.radius: 10
            label.text: "Tag Two"
            label.color: "#6AC044"
            background.color: "#F0F9EB"
            border.color: "#6AC044"
            onClosed: visible = false;
            theme.groupName: "success"
        }

        TTag{
            closable: true
            background.radius: 10
            label.text: "Tag Three"
            label.color: "#E4A147"
            background.color: "#FDF6ED"
            border.color: "#E4A147"
            onClosed: visible = false;
            theme.groupName: "warning"
        }

        TTag{
            closable: true
            background.radius: 10
            label.text: "Tag Four"
            label.color: "#F36D6F"
            background.color: "#FEF0F0"
            border.color: "#F36D6F"
            onClosed: visible = false;
            theme.groupName: "danger"
        }
    }

}
