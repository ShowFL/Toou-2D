import QtQuick 2.6

QtObject {
    id:tobject;

    default property alias children: tobject._children_private

    property list<QtObject> _children_private;
}
