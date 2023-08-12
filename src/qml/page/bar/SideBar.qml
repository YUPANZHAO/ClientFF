import QtQuick
import QtQuick.Layouts

import "../../../qml"
import "../../component/button"

Item {
  id: sideBar

  property var pageIcons: [
    { id: ClientFF.Page.HOME, icon: _RES_ICON_("home") },
    { id: ClientFF.Page.USER, icon: _RES_ICON_("user") },
    { id: ClientFF.Page.FILE, icon: _RES_ICON_("file") },
    { id: ClientFF.Page.EMAIL, icon: _RES_ICON_("email") },
  ]
  property var menuIcons: [
    { id: ClientFF.Menu.SHARE, icon: _RES_ICON_("share") },
    { id: ClientFF.Menu.SETTING, icon: _RES_ICON_("setting") },
  ]

  readonly property var curPage: ClientFF.Page.HOME

  signal clickPage(var pageId)
  signal clickMenu(var menuId)

  onClickPage: (pageId) => {
    curPage = pageId
  }

  width: 60
  height: parent.height
  anchors {
    left: parent.left
  }

  Rectangle {
    anchors.fill: parent
    color: _THEME_.getColor("bg_strong")
  }

  Column {
    anchors {
      top: parent.top
      topMargin: 20
      horizontalCenter: parent.horizontalCenter
    }
    spacing: 10
    Repeater {
      model: pageIcons
      delegate: pageIconDelegate
    }
  }

  Column {
    anchors {
      bottom: parent.bottom
      bottomMargin: 10
      horizontalCenter: parent.horizontalCenter
    }
    spacing: 5
    Repeater {
      model: menuIcons
      delegate: menuIconDelegate
    }
  }

  Component {
    id: pageIconDelegate
    IconBtn {
      size: 40
      radius: 8
      icon: modelData.icon
      showHighlight: true
      isChecked: curPage === modelData.id
      onClicked: clickPage(modelData.id)
    }
  }

  Component {
    id: menuIconDelegate
    IconBtn {
      size: 40
      icon: modelData.icon
      showBg: false
      showHighlight: true
      onClicked: clickMenu(modelData.id)
    }
  }
}