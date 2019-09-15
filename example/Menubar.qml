import QtQuick 2.6
import Toou2D 1.0

TPopup{
    id:popup
    signal topage(string uri,string title);
    property int  width;
    property int  height;
    property bool isopen: false;

    onOpened: isopen = true;
    onHided:  isopen = false;

    onTriggeredBackground: hide(true);
    backgroundComponent: null;

    TRectangle{
        id:bg
        width: popup.width;
        height: popup.height;
        x:isopen ? 0 : -width;
        theme.groupName: "menubg"
        color:"#3D3D3D"

        Column{
            spacing: 10;
            anchors.horizontalCenter: parent.horizontalCenter;

            Item{
                width: 10;
                height: 30;
            }

            TLabel{
                id:logo
                text: "T2D";
                font.pixelSize: TPixelSizePreset.PH1;
                font.bold: true;
                anchors.horizontalCenter: parent.horizontalCenter;
                theme.groupName: "menutitle"
                color: "#fff"
            }

            TDividerLine{
                width: popup.width * 0.9
                height: 1;
                color: "#464646"
            }

            Repeater{

                model: [
                    {label:"Home",icon:TAwesomeType.FA_home,uri:"qrc:/Home.qml"},
                    {label:"Control",icon:TAwesomeType.FA_rocket,uri:"qrc:/Control.qml"},
                    {label:"Demo",icon:TAwesomeType.FA_codiepie,uri:"qrc:/Demo.qml"},
                    {label:"Awesome",icon:TAwesomeType.FA_font_awesome,uri:"qrc:/Awesome.qml"},
                    {label:"Api docs",icon:TAwesomeType.FA_book,uri:"http://oss.toou.net/docs/2d/index.html"},
                    {label:"Github",icon:TAwesomeType.FA_github_alt,uri:"https://github.com/ShowFL/Toou-2D"},
                ]

                delegate: TIconButton{
                    width: parent.width;
                    spacing: 15
                    height: 40;
                    contentHAlign: Qt.AlignLeft
                    label.text: modelData.label;
                    label.color: "#FCFCFC"
                    icon.source: modelData.icon;
                    icon.color: "#FCFCFC"
                    backgroundComponent: null;
                    onClicked: {
                        topage(modelData.uri,modelData.label);
                        hide(true);
                    }
                }
            }
        }

        TLabel{
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 5;
            font.pixelSize: TPixelSizePreset.PH7
            text: "Version: " + T2D.version();
            color: "#909399"
        }

        Behavior on x {
            NumberAnimation {
                duration: 100
            }
        }
    }


}

