import QtQuick

Item {
  id: color
  
  readonly property var themeFile: _CONFIG_.themeFile
  property var metaData: null

  function init() {
    try {
      var content = file.readFile(themeFile)
      metaData = JSON.parse(content)
      console.log("获取主题配置成功")
    }catch(e) {
      console.log("获取主题配置失败", e)
    }
  }

  function getColor(name) {
    return metaData[name]
  }
}