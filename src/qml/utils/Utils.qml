import QtQuick
import QtQuick.Controls

import "./config"
import "./theme"

Item {
  id: utils

  readonly property var config: _config_
  readonly property var theme: _theme_
  
  Config {
    id: _config_
  }

  Theme {
    id: _theme_
  }
}