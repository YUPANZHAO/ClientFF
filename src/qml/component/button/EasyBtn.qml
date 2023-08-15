import QtQuick
import QtQuick.Controls

Item {
  id: easyBtn

  property var bgColor: _THEME_.getColor("theme")
  property var btnRadius: 4
  property var text: ""
  property var textSize: 14
  property var textColor: _THEME_.getColor("white")  
  property var showBorder: false
  property var borderWidth: 1
  property var borderColor: _THEME_.getColor("border")
  property var vPadding: 8
  property var hPadding: 8

  readonly property var isEnable: easyBtn.enabled
  readonly property var isHover: area.containsMouse
  readonly property var isPressed: area.pressed 

  width: content.width + hPadding * 2
  height: content.height + vPadding * 2
  
  signal clickedBtn()
  
  Rectangle {
    id: bg
    anchors.fill: parent
    color: bgColor
    radius: btnRadius
    border {
      width: showBorder ? borderWidth : 0
      color: borderColor
    }
    z: 1
  }

  Rectangle {
    anchors.fill: bg
    color: _THEME_.getColor("black")
    opacity: isEnable ? isPressed ? 0.15 : isHover ? 0.08 : 0 : 0.15
    radius: btnRadius
    z: isPressed ? 4 : 2
  }
  
  Text {
    id: content
    anchors.centerIn: parent
    text: easyBtn.text
    height: textSize
    font.pixelSize: textSize
    verticalAlignment: Text.AlignVCenter
    font.weight: Font.Light
    color: textColor
    z: 3
  }
  
  MouseArea {
    id: area
    anchors.fill: parent
    hoverEnabled: true
    onClicked: clickedBtn()
  }
}