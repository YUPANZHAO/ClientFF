import QtQuick
import QtQuick.Controls
import org.wangwenx190.FramelessHelper

import "./bar"
import "../../qml"

Window {
  id: main

  property var pages: [
    { type: ClientFF.Page.HOME, page: "homepage/HomePage.qml" },
  ]

  width: 800
  height: 500
  minimumWidth: 700
  minimumHeight: 450

  function changePage(pageId) {
    sideBar.clickPage(pageId)
  }

  Pane {
    anchors.fill: parent
    focusPolicy: Qt.ClickFocus
  }

  FramelessHelper.onReady: {
    FramelessHelper.moveWindowToDesktopCenter()
    FramelessHelper.setTitleBarItem(titleBar)
    main.show()
  }
    
  Item {
    id: content
    
    anchors {
      left: sideBar.right
      right: parent.right
      top: titleBar.bottom
      bottom: parent.bottom
    }
    
    Rectangle {
      anchors.fill: parent
      color: _THEME_.getColor("bg_light")
    }

    Repeater {
      model: pages
      delegate: Loader {
        anchors.fill: parent
        source: modelData.page
        visible: sideBar.curPage === modelData.type
      }
    }
  }
  
  TitleBar {
    id: titleBar
  }

  SideBar {
    id: sideBar
  }
}