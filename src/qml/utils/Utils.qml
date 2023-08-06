import QtQuick
import QtQuick.Controls

import "./config"
import "./color"

Item {
  id: utils

  readonly property var config: _config_
  readonly property var color: _color_
  

  Config {
    id: _config_
    
    onInitSuccess: {
      utils.color.init()
    }
  }

  Color {
    id: _color_
  }
}