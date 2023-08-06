import QtQuick

Item {
  id: sideBar
  
  width: 60
  height: parent.height
  anchors {
    left: parent.left
  }

  Rectangle {
    anchors.fill: parent
    color: _COLOR_.getColor("bg_strong")
  }
  
}