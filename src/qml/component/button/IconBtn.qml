import QtQuick

Item {
  id: iconBtn
  
  property var size: 30
  property var icon: ""
  property var iconSize: size * 0.6
  property var radius: 0
  property var normalBgColor: _COLOR_.getColor("icon_bg_normal")
  property var hoverBgColor: _COLOR_.getColor("icon_bg_hover")
  property var highlightBgColor: _COLOR_.getColor("icon_bg_highlight")

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
    color: isPressed ? highlightBgColor : isHover ? hoverBgColor : normalBgColor
    radius: iconBtn.radius
  }

  Image {
    anchors.centerIn: parent
    source: icon
    sourceSize.width: iconSize
    sourceSize.height: iconSize
  }

  MouseArea {
    id: area
    anchors.fill: parent
    hoverEnabled: true
    onClicked: iconBtn.clicked(mouse)
    onDoubleClicked: iconBtn.doubleClicked(mouse)
    onPressed: iconBtn.pressed(mouse)
    onReleased: iconBtn.released(mouse)
  }
}