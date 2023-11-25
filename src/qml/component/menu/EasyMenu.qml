import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import "../image"

Menu {
  id: easyMenu

  property var menuWidth: 130
  property var itemHeight: 34
  property var bgColor: _THEME_.getColor("bg_light")
  property var borderColor: _THEME_.getColor("menu_frame_line")
  property var itemBgColor: _THEME_.getColor("box_bg_color")
  property var itemBgColorHighlight: _THEME_.getColor("box_bg_color_highlight")
  property var borderWidth: 1
  property var bgRadius: 3
  property var itemRadius: 3
  property var showAble: true

  topPadding: 4
  bottomPadding: topPadding

  icon.name: showAble ? "Show" : "Hide"

  function open(x, y) {
    easyMenu.x = x
    easyMenu.y = y
    easyMenu.popup()
  }

  background: Rectangle {
    id: bgRec
    implicitWidth: menuWidth
    implicitHeight: 10
    color: bgColor
    radius: bgRadius
    border {
      width: borderWidth
      color: borderColor
    }

    layer.enabled: true
    layer.effect: DropShadow{
      anchors.fill: bgRec
      visible: bgRec.visible
      source: bgRec
      horizontalOffset: 0
      verticalOffset: 0
      radius: 16
      samples: 32
      color: _THEME_.getColor("shadow")
    }
  }

  delegate: MenuItem {
    id: menuItem

    leftInset: 6
    rightInset: leftInset
    topInset: 3
    bottomInset: topInset

    height: menuItem.icon.name === "Show" ? itemHeight : 0
    visible: menuItem.icon.name === "Show"

    arrow: ImageSvg {
      size: 8
      image: _RES_ICON_("arrow")
      visible: menuItem.subMenu
      anchors {
        right: bgRec.right
        rightMargin: 8
        verticalCenter: bgRec.verticalCenter
      }
    }

    background: Rectangle {
      id: bgRec
      color: menuItem.enabled && ((menuItem.subMenu && menuItem.highlighted) || menuItem.hovered) ? menuItem.pressed ? itemBgColorHighlight : itemBgColor : _THEME_.getColor("empty")
      radius: itemRadius
    }

    contentItem: Text {
      anchors.fill: bgRec
      text: menuItem.text
      font.pixelSize: 13
      font.weight: Font.Light
      leftPadding: 8
      verticalAlignment: Text.AlignVCenter
      color: menuItem.enabled ? _THEME_.getColor("font") : _THEME_.getColor("font_light")
      elide: Text.ElideRight
    }
  }
}