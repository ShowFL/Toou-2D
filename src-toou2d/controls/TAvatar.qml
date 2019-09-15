import QtQuick 2.6
import Toou2D 1.0
/*!
    \qmltype TAvatar
    \inqmlmodule QtQuick 2.6
    \brief Picture with rounded corners
    \since 5.9.x
    \ingroup qtquicktest

    Display user or object information in the form of ICONS, pictures, or characters.

    \code
    TAvatar {
        id: avatar

    }
    \endcode

    When the display type is picture

    \sa {QtTest::TestCase}{TestCase}, {Qt Quick Test Reference Documentation}
*/
Item {
    id:toou2d_avatar
    width:  sourceImage.sourceSize.width;
    height: sourceImage.sourceSize.height;

    property int   radius;

    /*! A border
    \sa TGadgetBorder */
    property alias border:  mborder;

    property alias source : sourceImage.source;

    property alias fillMode:sourceImage.fillMode;

    property bool  asynchronous: true;

    property bool  smooth: true

    /*! Binding tool, which changes the style of the current control.
    \sa TThemeBinder */
    property alias theme:  mtheme;

    TGadgetBorder{
        id:mborder;
        width: 0
        color: "#8D8D8D";
    }

    Image {
        id: sourceImage
        visible:      false;
        enabled:      false;
        anchors.fill: parent;
        antialiasing: toou2d_avatar.smooth;
        smooth:       toou2d_avatar.smooth;
        asynchronous: toou2d_avatar.asynchronous;
    }

    Rectangle {
        id: mask
        color:        "black"
        anchors.fill: parent;
        radius:       toou2d_avatar.radius;
        visible:      false
        antialiasing: true
        smooth:       true
        enabled:      false;
    }

    TMask{
        anchors.fill: parent;
        sourceItem: sourceImage;
        maskItem: mask;
    }

    TRectangle{
        color: "transparent"
        radius: toou2d_avatar.radius;
        border.width: mborder.width;
        border.color: mborder.color;
        anchors.fill: parent;
        theme.parent: mtheme;
    }

    TThemeBinder{
        id:mtheme;
        className: "TAvatar"
        property alias radius: toou2d_avatar.radius;

        Component.onCompleted: initialize();
    }
}
