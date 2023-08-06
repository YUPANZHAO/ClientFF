import QtQuick
import ClientFF

Item {
  id: config

  property var configFilePath: "config/config.json"
  property var metaData: null
  readonly property var themeFile: getConfig("theme_file")

  signal initSuccess()
  signal initFailed(var errMsg)

  onInitSuccess: {
    console.log("获取配置文件成功")
  }

  onInitFailed: {
    console.log("获取配置文件失败", errMsg)
  }

  Component.onCompleted: init()  

  function init() {
    try {
      var content = file.readFile(configFilePath)
      metaData = JSON.parse(content)
      initSuccess()
    }catch(e) {
      initFailed(e)
    }
  }

  function getConfig(key) {
    return metaData[key]
  }

  function setConfig(key, name) {
    if(!metaData) return false
    metaData[key] = name
    return file.writeFile(configFilePath, JSON.stringify(metaData))
  }
}