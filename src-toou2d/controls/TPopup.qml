import QtQuick 2.6
import Toou2D 1.0

TObject {

    property Item backgroundItem : backgroundItemComponent.createObject();

    function open(){
        _popup._create();
    }

    function close(){
        _popup._destroy();
    }

    property QtObject _popup: TObject{

        property Item mask: null;

        function _create(){
            mask = maskComponent.createObject(_root_window_);

            if(backgroundItem)
                backgroundItem.parent = mask;
        }

        function _destroy(){
            if(mask)
                mask.destroy();
        }
    }


    Component{
        id:maskComponent
        TMouseArea{
            anchors.fill: parent;
            onClicked: {
                close();
            }
        }
    }

    Component{
        id:backgroundItemComponent
        Rectangle{
            anchors.fill: parent;
            color: "#000";

            NumberAnimation on opacity {
                from:0
                to: 0.3
                duration: 300
                running: parent;
            }
        }
    }

}

