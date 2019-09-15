#include "Toou2D.h"
#include "t2d.h"

/*!
  \page index.html
  \title Toou2D 1.0


  \section1 \b Description
  基于Qt Quick(Qml) 跨平台技术打造的2D框架

  \module QtQuick 2.6

  \section1 \b Core Class
    \table 100%
    \row
      \o \l Toou2D
      \o \l T2DWorld
      \o \l T2D
    \row
      \o \l Toou2DQmlPlugin
      \o \l ThemeManager
      \o \l ThemeHandler
    \row
      \o \l ThemeBinder
      \o \l TGadgetScrollbar
      \o \l TGadgetLabel
    \row
      \o \l TGadgetItem
      \o \l TGadgetIcon
      \o \l TGadgetBorder
   \row
      \o \l TGadgetBackground
      \o \l TColor
      \o
   \endtable


  \section1 \b Controls
  \table 100 %
  \row
    \o \l TAvatar
    \o \l TAwesomeIcon
    \o \l TBadge
\row
    \o \l TBusyIndicator
    \o \l TButton
    \o \l TCarousel
\row
    \o \l TCarouselElement
    \o \l TCheckBox
    \o \l TDialog
\row
    \o \l TDialogButton
    \o \l TDividerLine
    \o \l TFlickable
\row
    \o \l TFpsMonitor
    \o \l TIcon
    \o \l TIconButton
\row
    \o \l TImage
    \o \l TImageButton
    \o \l TInputField
\row
    \o \l TLabel
    \o \l TToast
    \o \l TMouseArea
\row
    \o \l TNavigationBar
    \o \l TNavigationElement
    \o \l TObject
\row
    \o \l TPagination
    \o \l TPopoverMenu
    \o \l TPopoverElement
\row
    \o \l TPopup
    \o \l TProgressBar
    \o \l TRadioBox
\row
    \o \l TRadioBoxGroup
    \o \l TRectangle
    \o \l TScrollbarH
\row
    \o \l TScrollbarV
    \o \l TSVGIcon
    \o \l TSwitch
\row
    \o \l TTag
    \o \l TDialogBasic
    \o \l TPopover
 \endtable


  \section1 \b Enum Define
  \table 100 %
  \row
    \o \l TStateType
    \o \l TIconType
    \o \l TAwesomeType
  \row

    \o \l TTimePreset
    \o \l TPixelSizePreset
    \o \l TPosition
  \endtable


  */


/*!
  \class Toou2D

  \brief

  \sa Toou2D
  */
void Toou2D::create(QQmlEngine *engine)
{
    T2D::getInstance()->registerTypes(URI_STR);
    T2D::getInstance()->initializeEngine(engine,URI_STR);
}

QString Toou2D::version()
{
    return T2D::getInstance()->version();
}
