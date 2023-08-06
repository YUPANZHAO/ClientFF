import QtQuick
import org.wangwenx190.FramelessHelper

import "./bar"

Window {
  id: main

  width: 900
  height: 600
  minimumWidth: 700
  minimumHeight: 450

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
      color: _COLOR_.getColor("bg_light")
    }
  }
  
  TitleBar {
    id: titleBar
  }

  SideBar {
    id: sideBar
  }
}