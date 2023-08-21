import QtQuick
import org.wangwenx190.FramelessHelper

import "./page"
import "./utils"

Item {
  id: root

  readonly property var _CONFIG_: utils.config
  readonly property var _THEME_: utils.theme

  readonly property var _RES_: (path) => { return "qrc:/ClientFF/res/" + path }
  readonly property var _RES_ICON_: (name) => { return _RES_("icon/" + name) }

  width: window.width
  height: window.height

  FramelessHelper.onReady: {
    FramelessHelper.moveWindowToDesktopCenter()
    FramelessHelper.setTitleBarItem(root)
    window.show()
  }

  Utils {
    id: utils
  }

  Main {
    id: window
  }
}