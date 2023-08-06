import QtQuick

import "./page"
import "./utils"

Item {
  id: root

  readonly property var _CONFIG_: utils.config
  readonly property var _COLOR_: utils.color

  Utils {
    id: utils
  }

  Main {
    id: window
  }
}