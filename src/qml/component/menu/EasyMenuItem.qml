import QtQuick
import QtQuick.Controls

Action {
  id: easyMenuItem

  property var showAble: true
  
  // 利用icon.name传递给EasyMenu的delegate是否显示该Item
  icon.name: showAble ? "Show" : "Hide"
}