import QtQuick
import QtQuick.Controls

MenuSeparator {
  id: easyMenuSeparator

  topPadding: 3
  bottomPadding: 3
  leftPadding: 10
  rightPadding: leftPadding

  contentItem: Rectangle {
    implicitHeight: 1
    color: _THEME_.getColor("menu_separator_line")
  }
}