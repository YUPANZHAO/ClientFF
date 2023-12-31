import QtQuick
import QtQuick.Controls

import "../image"

Item {
  id: inputBox

  property var radius: 4
  property var hPadding: 0
  property var vPadding: 0
  property var hint: ""

  width: 200
  height: 30

  signal textEnd(var text)

  Rectangle {
    id: boxBg
    anchors.fill: parent
    radius: inputBox.radius
    border.width: 1
    border.color: _THEME_.getColor(textInput.focus ? "theme" : "empty")
    color: _THEME_.getColor("box_bg_color")
  }

  ImageSvg {
    id: cancelBtn
    anchors {
      verticalCenter: parent.verticalCenter
      right: boxBg.right
      rightMargin: 9
    }
    visible: textInput.length > 0
    image: _RES_ICON_("window-close")
    size: 7
    showPointingHand: true
    onClicked: textInput.clear()
  }

  TextField {
    id: textInput
    anchors {
      left: parent.left
      right: cancelBtn.left
      top: parent.top
      bottom: parent.bottom
    }
    verticalAlignment: TextInput.AlignVCenter
    persistentSelection: true
    anchors {
      topMargin: vPadding
      bottomMargin: vPadding
      leftMargin: hPadding
      rightMargin: hPadding
    }
    font.weight: Font.ExtraLight
    clip: true
    onEditingFinished: {
      focus = false
    }
    onAccepted: textEnd(textInput.text)
    background: null
    placeholderText: hint
    placeholderTextColor: _THEME_.getColor("font_light")
    color: _THEME_.getColor("font")
  }
}