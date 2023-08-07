import QtQuick

import "./page"
import "./utils"

Item {
  id: root

  readonly property var _CONFIG_: utils.config
  readonly property var _COLOR_: utils.color
  
  readonly property var _RES_: (path) => { return "qrc:/ClientFF/res/" + path }
  readonly property var _RES_ICON_: (name) => { return _RES_("icon/" + name) }

  Utils {
    id: utils
  }

  Main {
    id: window
  }
}