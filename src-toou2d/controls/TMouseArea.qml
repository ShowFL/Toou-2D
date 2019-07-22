import QtQuick 2.6

MouseArea{

    property bool checkable: false;
    property bool checked: false;

    QtObject{
        id:_private;
        property string sNormal: "normal"
        property string sHovering: "hovering"
        property string sPressed: "pressed"
    }

    state: {
        if(checkable && checked){
            state = _private.sHovering;
        }

        return _private.sNormal;
    }

    onEntered: {
        if(hoverEnabled){
            state = containsPress ? _private.sPressed : _private.sHovering;
        }
    }

    onExited: {
        if(checkable && checked){
            state = _private.sHovering;
        }else{
            state = _private.sNormal;
        }
    }

    onPressed: {
        state = _private.sPressed;
    }

    onReleased: {
        if(checkable){
            checked = !checked;
            state = checked ? _private.sHovering : _private.sNormal;
        }else{
            state = hoverEnabled && containsMouse ? _private.sHovering : _private.sNormal;
        }
    }

}
