import QtQuick
import Qt5Compat.GraphicalEffects

import "../button"

Window {
  id: fixedWindowBox

  property var bgColor: _THEME_.getColor("bg_light")
  property var windowRadius: 6
  property var showCloseBtn: true
  property var closeBtnSize: 20
  property var closeBtnTopPadding: 8
  property var closeBtnRightPadding: 8
  property Component content: Item {}
  
  readonly property var contentItem: contentLoader.item

  flags:Qt.FramelessWindowHint
  color: _THEME_.getColor("empty")
  width: box.width + 32
  height: box.height + 32
  
  Rectangle {
    id: box
    width: childrenRect.width
    height: childrenRect.height
    color: bgColor
    radius: windowRadius
    anchors.centerIn: parent
    z: 1

    Loader {
      id: contentLoader
      sourceComponent: content
    }
  }

  IconBtn {
    anchors {
      top: box.top
      right: box.right
      topMargin: closeBtnTopPadding
      rightMargin: closeBtnRightPadding
    }
    size: closeBtnSize
    icon: _RES_ICON_("window-close")
    radius: 4
    onClicked: fixedWindowBox.close()
    z: 2
  }

  DropShadow {
    anchors.fill: box
    horizontalOffset: 0
    verticalOffset: 0
    radius: 16
    samples: 32
    color: _THEME_.getColor("shadow")
    source: box
  }
}