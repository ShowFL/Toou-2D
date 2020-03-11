import QtQuick 2.6
import Toou2D 1.0

// T2D 基础控件*/
/*! TODO */
MouseArea{
    id:toou2d_mousearea;

    cursorShape: enabled ? T2D.mouseAreaCursorShape() : Qt.ArrowCursor;

    property bool stateEnabled:true;

    property bool checkable:   false;

    property bool checked:     false;

    property bool takeFocus:   true;

    property int stateenum:    0;

    state: {
        if(checkable && checked){
            setState(TStateType.Hovering);
        }

        return setState(TStateType.Normal);
    }

    onEntered: {
        if(hoverEnabled){
            setState(containsPress ? TStateType.Pressed : TStateType.Hovering);
        }
    }

    onExited: {
        if(checkable && checked){
            setState(TStateType.Checked);
        }else{
            setState(TStateType.Normal);
        }
    }

    onCanceled: {
        setState(TStateType.Normal);
    }

    onPressed: {
        setState(TStateType.Pressed);
        if(takeFocus) focus = true;
    }

    onReleased: {
        if(checkable){
            checked = !checked;
            setState(checked ? TStateType.Checked : TStateType.Normal);
        }else{
            setState(hoverEnabled && containsMouse ? TStateType.Hovering : TStateType.Normal);
        }
    }

    function setState(val){
        if(!stateEnabled )return;
        stateenum = val;
        state = statetoString(val);
    }

    function statetoString(value){
        switch(value){
        case TStateType.Normal :  return "normal";
        case TStateType.Hovering: return "hovering";
        case TStateType.Checked : return "checked";
        case TStateType.Pressed : return "pressed";
        }
        return "none";
    }

}
