import QtQuick 2.6
import Toou2D 1.0

//分页、页导航*/
/*! TODO */
Item {
    id:toou2d_pagination;

    signal triggered(var index);

    property int currentIndex: 0;

    property int count: 3;

    property int spacing: 2;

    property alias itemBackground: mitembg;

    property alias itemActiveBg:   mitemactbg;

    property alias itemBorder:     mitemborder;

    property alias itemActiveBorder:mitemactborder;

    property alias theme: mtheme;

    property Component contentComponent;

    width:  content.width;

    height: content.height;

    contentComponent: TButton{
        theme.enabled: false;
        backgroundComponent: null;
        padding: 12;
        opacity: mitembg.opacity;
        contentComponent: TRectangle{
            property bool active: currentIndex === index ;
            width:  active ? mitemactbg.width  : mitembg.width;
            height: active ? mitemactbg.height : mitembg.height;
            radius: active ? mitemactbg.radius : mitembg.radius;
            color: {
                TThemeManager.appThemeInvalid;
                return active ? mitemactbg.color : mitembg.color;
            }

            border.width: active ? mitemactborder.width : mitemborder.width;
            border.color: active ? mitemactborder.color : mitemborder.color;
            theme.enabled: false;
        }

        onClicked: {
            toou2d_pagination.triggered(index);
        }
    }

    Row{
        id:content;
        spacing: toou2d_pagination.spacing;

        Repeater{
            model: toou2d_pagination.count;
            delegate: contentComponent;
        }
    }

    TGadgetBackground{
        id:mitembg;
        color:  "#ECECEC"
        radius: 2;
        width:  25;
        height: 4;
    }

    TGadgetBackground{
        id:mitemactbg
        color:  "#FC6A21"
        radius: 2;
        width:  25;
        height: 4;
    }

    TGadgetBorder{
        id:mitemborder;
    }

    TGadgetBorder{
        id:mitemactborder;
    }

    TThemeBinder{
        id:mtheme;
        className: "TPagination";

        property alias spacing: toou2d_pagination.spacing;

        TThemeBinder{
            childName:  "item";
            property alias opacity: mitembg.opacity;
            property alias width:   mitembg.width;
            property alias height:  mitembg.height;
            property alias radius:  mitembg.radius;
            property alias color:   mitembg.color;
        }

        TThemeBinder{
            childName:  "item.active";
            property alias opacity: mitemactbg.opacity;
            property alias width:   mitemactbg.width;
            property alias height:  mitemactbg.height;
            property alias radius:  mitemactbg.radius;
            property alias color:   mitemactbg.color;
        }

        TThemeBinder{
            childName:  "item.border";
            property alias width:   mitemborder.width;
            property alias color:   mitemborder.color;
        }

        TThemeBinder{
            childName:  "item.active.border";
            property alias width:   mitemactborder.width;
            property alias color:   mitemactborder.color;
        }

        Component.onCompleted: initialize();
    }

}
