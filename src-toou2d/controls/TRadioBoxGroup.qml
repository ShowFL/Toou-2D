import QtQuick 2.6
import Toou2D 1.0

/* 单选按钮组
    在组内的单选按钮选择是唯一的
*/
/*! TODO */
TObject {
    id:toou2d_radioboxgroup

    property Item parent;

    readonly property alias currentIndex: _private.currentIndex;

    readonly property Item currentItem: {
        if(currentIndex  !== -1){
            return children[currentIndex];
        }
        return null;
    }

    readonly property TObject _: TObject{
        id:_private;
        property int currentIndex: -1;
    }

    default property alias children: toou2d_radioboxgroup.mchilds;

    property list<TRadioBox> mchilds;

    onChildrenChanged: {
        var i = children.length - 1;
        var trb = children[i];
        trb.parent = parent;
        trb.groupIndex = i;

        if(_private.currentIndex !== -1)
            trb.checked = false;
        else if(trb.checked)
            _private.currentIndex = i;

        trb.checkedChanged.connect(function(){
            if(trb.checked)
                _private.currentIndex = trb.groupIndex;
        });
    }

    onCurrentIndexChanged: {
        for(var child in children){
            var cobj = children[child] ;
            if( cobj.groupIndex !== _private.currentIndex)
                cobj.checked = false;
        }
    }

    Component.onCompleted: {
        if(_private.currentIndex == -1){
            var cobj = children[0];
            if(cobj)cobj.checked = true;
        }
    }
}
