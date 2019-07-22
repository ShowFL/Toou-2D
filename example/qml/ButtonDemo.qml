import QtQuick 2.0
import Toou2D 1.0

TRectangle {
    theme.className: "background"

    Column{
        anchors.top: parent.top;
        anchors.topMargin: 40;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 40;
        Row{
            spacing: 60;

            Column{
                spacing: 20;

                TButton{
                    text: "Button Default"
                }

                TButton{
                    text: "Button hover"
                    hoverEnabled: true;
                }

                TButton{
                    text: "Button checkable"
                    checkable: true;
                    checked: true;
                }

                TButton{
                    text: "Button clear"
                    backgroundItem: null;
                }


            }

            Column{
                spacing: 20;
                TIconButton{
                    iconLayout: T2D.IconLeft;
                    iconSource: T2D.FA_angle_left;
                    text: "Back";
                }

                TIconButton{
                    iconLayout: T2D.IconReght;
                    iconSource: T2D.FA_angle_right;
                    text: "Next";
                }

                Row{
                    spacing: 20;
                    TIconButton{
                        iconSource: T2D.FA_gear;
                    }

                    TIconButton{
                        theme.className: "nobg"
                        iconSource: T2D.FA_apple;
                        hoverEnabled: true;
                    }

                }

            }

        }

        Column{
            spacing: 20;
            TButton{
                width: 300;
                text: "Button balanced"
                theme.className: "balanced"
                cursorShape: Qt.PointingHandCursor;
            }

            TButton{
                width: 300;
                text: "Button royal"
                theme.className: "royal"
                cursorShape: Qt.PointingHandCursor;
            }

            TButton{
                width: 300;
                text: "Button calm"
                theme.className: "calm"
                font.pixelSize: 18
                cursorShape: Qt.PointingHandCursor;
            }

            TButton{
                id:btn;
                width: 300;
                font.pixelSize: 18;
                hoverEnabled: true;
                contentItem: TLabel{
                    theme.enabled: false;
                    text: "Button custom";
                    font:btn.font;
                    color: "#fff";
                }

                backgroundItem: TRectangle{
                    theme.enabled: false;
                    radius: 3;
                    border.width: 1;
                    border.color: "#cb9c36"
                    color:{
                        if(btn.state == "hovering"){
                            return "#f0b840";
                        }
                        else if(btn.state == "pressed"){
                            return "#cb9c36";
                        }
                        return "#f0b840";
                    }
                }

            }
        }
    }
}
