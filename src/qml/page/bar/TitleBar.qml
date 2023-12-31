import QtQuick
import QtQuick.Controls
import QtQml
import QtQuick.Window
import org.wangwenx190.FramelessHelper

import "../../component/button"

Item {
  id: titleBar

  readonly property var window: main

  property var preWindowStatu: null

  width: parent.width
  height: 30
  anchors {
    top: parent.top
  }
  
  Connections {
    target: window
    function onVisibilityChanged() {
      if(window.visibility !== Window.Minimized && preWindowStatu === Window.Maximized) {
        preWindowStatu = null
        window.showMaximized()
      }
    }
  }

  FramelessHelper.onReady: {
    FramelessHelper.setHitTestVisible(minimizeButton)
    FramelessHelper.setHitTestVisible(maximizeButton)
    FramelessHelper.setHitTestVisible(closeButton)
  }

  Rectangle {
    anchors.fill: parent
    color: _THEME_.getColor("bg")
  }

  Row {
    height: parent.height
    anchors {
      verticalCenter: parent.verticalCenter
      right: parent.right
    }
    IconBtn {
      id: minimizeButton
      size: parent.height
      width: size * 1.2
      icon: _RES_ICON_("window-minimize")
      iconSize: 13
      onClicked: {
        preWindowStatu = window.visibility
        window.showMinimized()
      }
    }
    IconBtn {
      id: maximizeButton
      size: parent.height
      width: size * 1.2
      icon: _RES_ICON_("window-%1.svg".arg(window.visibility === Window.Maximized ? "restore" : "maximize"))
      iconSize: 10
      onClicked: {
        if(window.visibility === Window.Maximized) {
          window.showNormal()
        }else {
          window.showMaximized()
        }
      }
    }
    IconBtn {
      id: closeButton
      size: parent.height
      width: size * 1.2
      hoverBgColor: _THEME_.getColor("red")
      highlightBgColor: _THEME_.getColor("red_strong")
      icon: _RES_ICON_("window-close")
      iconSize: 10
      onClicked: {
        window.close()
      }
    }
  }
}