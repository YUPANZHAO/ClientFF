import QtQuick

Item {
  id: theme
  
  readonly property var themeFile: _CONFIG_.themeFile
  readonly property var infoProperty: "info"
  readonly property var colorProperty: "color"
  readonly property var name: getInfo("name")
  property var metaData: null 

  onThemeFileChanged: {
    init()
  }

  function init() {
    try {
      var content = file.readFile(themeFile)
      metaData = JSON.parse(content)
    }catch(e) {}
  }

  function getInfo(name) {
    return metaData[infoProperty][name]
  }

  function getColor(name) {
    return metaData[colorProperty][name]
  }

  function changeTheme(name) {
    if(name == theme.name) return
    switch(name) {
      case "light": _CONFIG_.setConfig("theme_file","config/theme/default.json"); break;
      case "dark": _CONFIG_.setConfig("theme_file","config/theme/dark.json"); break;
    }
  }
}