import QtQuick

Item {
  id: config

  property var metaData: globalConfig.metaData
  readonly property var themeFile: getConfig("theme_file")

  function getConfig(key) {
    return metaData[key]
  }

  function setConfig(key, name) {
    if(!metaData) return
    globalConfig.setValue(key, name)
  }
}