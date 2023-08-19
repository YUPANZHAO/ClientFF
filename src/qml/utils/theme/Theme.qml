import QtQuick

Item {
  id: theme
  
  readonly property var themeFile: _CONFIG_.themeFile
  readonly property var colorProperty: "color" 
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

  function getColor(name) {
    return metaData[colorProperty][name]
  }
}