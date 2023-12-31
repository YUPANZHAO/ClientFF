import QtQuick

Text {
  id: easytext

  property var fontSize: 14

  font.pixelSize: fontSize
  font.weight: Font.Light
  verticalAlignment: Text.AlignVCenter
  color: _THEME_.getColor("font")
  wrapMode: Text.Wrap
}