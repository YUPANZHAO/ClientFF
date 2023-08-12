import QtQuick
import Qt5Compat.GraphicalEffects

Item {
  id: imageSvg

  property var image: ""
  property var size: 30
  property var imageWidth: size
  property var imageHeight: size
  property var color: _THEME_.getColor("icon_normal")
  property var showPointingHand: false

  signal clicked()

  width: size
  height: size

  Image {
    id: iconImage
    anchors.centerIn: parent
    source: image
    sourceSize.width: imageWidth
    sourceSize.height: imageHeight
    visible: false
  }

  ColorOverlay {
    anchors.fill: iconImage
    source: iconImage
    color: parent.color
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: showPointingHand && containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
    onClicked: imageSvg.clicked()
  }
}