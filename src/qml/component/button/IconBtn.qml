import QtQuick
import Qt5Compat.GraphicalEffects

import "../image"

Item {
  id: iconBtn
  
  property var size: 30
  property var icon: ""
  property var iconSize: size * 0.5
  property var radius: 0
  property var isChecked: false
  property var showBg: true
  property var normalBgColor: _COLOR_.getColor("icon_bg_normal")
  property var hoverBgColor: _COLOR_.getColor("icon_bg_hover")
  property var highlightBgColor: _COLOR_.getColor("icon_bg_highlight")
  property var showHighlight: false
  property var iconNoramlColor: _COLOR_.getColor("icon_normal")
  property var iconHighlightColor: _COLOR_.getColor("icon_highlight")

  readonly property var isHover: area.containsMouse
  readonly property var isPressed: area.pressed

  signal clicked(var mouse)
  signal doubleClicked(var mouse)
  signal pressed(var mouse)
  signal released(var mouse)

  width: size
  height: size

  Rectangle {
    anchors.fill: parent
    color: isChecked ? hoverBgColor : isPressed ? highlightBgColor : isHover ? hoverBgColor : normalBgColor
    radius: iconBtn.radius
    visible: showBg
  }

  ImageSvg {
    id: iconImage
    anchors.centerIn: parent
    image: icon
    size: iconSize
    color: isChecked || (showHighlight && isHover) ? iconHighlightColor : iconNoramlColor
  }

  MouseArea {
    id: area
    anchors.fill: parent
    hoverEnabled: true
    onClicked: (mouse) => { iconBtn.clicked(mouse) }
    onDoubleClicked: (mouse) => { iconBtn.doubleClicked(mouse) }
    onPressed: (mouse) => { iconBtn.pressed(mouse) }
    onReleased: (mouse) => { iconBtn.released(mouse) }
  }
}