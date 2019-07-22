import QtQuick 2.6
import Toou2D 1.0

TPopup {
    id:popover

    property alias theme: theme;

    signal clicked(var element);

    function open(pos_x,pos_y){
        _popup._create();
        _popover._create(pos_x,pos_y);
    }

    backgroundItem: null;
    property alias width: _content.width;

    default property alias children: _popover._children_private

    property Component backgroundItemv: TRectangle{
        radius: 3;
        theme.enabled: false;
        color: popover.theme.bg_color;
        border.width: 1;
        border.color: Qt.darker(color,1.2);
    }

    QtObject{
        id: _popover

        property list<TPopoverElement> _children_private;

        function _create(x,y){

            backgroundLoader.parent = _popup.mask;
            backgroundLoader.x = x;
            backgroundLoader.y = y;

            _content.parent = backgroundLoader;

            if(backgroundLoader.width + x > _root_window_.width){
                backgroundLoader.x = _root_window_.width - 5 - backgroundLoader.width;
            }

            if(backgroundLoader.height + y > _root_window_.height){
                backgroundLoader.y = _root_window_.height - 5 - backgroundLoader.height;
            }
        }
    }

    Loader{
        id:backgroundLoader
        sourceComponent: backgroundItemv;
        width: _content.width + 2;
        height: _content.height + 10;
    }

    ListView{
        id:_content;
        width: contentWidth;
        height: contentHeight;
        model: _popover._children_private
        anchors.centerIn: backgroundLoader;
        flickableDirection: Flickable.AutoFlickDirection
        delegate: Item{
            width: _content.width;
            height: 35;

            TRectangle{
                theme.enabled: false;
                anchors.fill: parent;
                color: popover.theme.item_bg;
                visible: mouseArea.state === "hovering" ;
            }

            Row{
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                spacing: 10;
                TAwesomeIcon{
                    source: modelData.icon;
                }

                TLabel{
                    text: label;
                }
            }

            TMouseArea{
                id:mouseArea;
                hoverEnabled: true
                anchors.fill: parent;
                onClicked: {
                    popover.clicked(modelData);
                }
            }
        }
    }

    //windows changed close popover..
    Connections{
        target: _root_window_
        onWidthChanged:close();
        onHeightChanged:close();
    }

    TThemeBinder{
        id:theme
        type:"Popover"

        property color bg_color: bindingColor("bg_color","#fff");
        property color item_bg: bindingColor("item_bg","#5d5d5d");
    }
}
