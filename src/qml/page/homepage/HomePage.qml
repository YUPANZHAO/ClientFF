import QtQuick

import "../../../qml"

Item {
  id: homepage

  Text {
    id: slogan
    text: "CLIENT FOR FUN"
    font.family: "Arial"
    font.pixelSize: 50
    color: _THEME_.getColor("font_light_more")
    anchors.centerIn: parent
  }
}