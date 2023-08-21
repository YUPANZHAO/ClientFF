import QtQuick

Text {
  id: easytext

  font.pixelSize: 14
  font.weight: Font.Light
  verticalAlignment: Text.AlignVCenter
  color: _THEME_.getColor("font")
  wrapMode: Text.Wrap
}