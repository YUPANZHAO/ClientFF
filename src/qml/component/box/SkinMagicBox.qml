import QtQuick
import Qt5Compat.GraphicalEffects
import QtQml

Item {
  id: skinMagicBox
    
  readonly property var theme: _THEME_.name
  property var shootcut: null
  property var start_x: 0
  property var start_y: 0
  property var isRuning: false
  property var isMask: false
  property var isAnima: false
  property var handle: null

  onThemeChanged: {
    if(!isRuning) return
    anima()
  }

  Image {
    id: shootImage
    anchors.fill: parent
    source: shootcut ? "file:///" + shootcut : ""
    smooth: true
    visible: false
    cache: false
    onStatusChanged: {
      if(status == Image.Ready) {
        isMask = true
        handle()
      }
    } 
  }

  Item {
    id: maskRec
    anchors.fill: parent
    clip: true
    smooth: true
    visible: false
  
    Rectangle {
      id: masRecimpl
      x: start_x - width / 2
      y: start_y - height / 2
      width: 0
      height: width
      radius: width / 2

      NumberAnimation on width {
        from: 0
        to: (skinMagicBox.width + skinMagicBox.height) * 2
        running: isAnima
        duration: 1000
        easing.type: Easing.InOutSine
        onStopped: {
          shootcut = null
          isAnima = false
          isMask = false
          handle = false
          masRecimpl.width = 0
          isRuning = false
        }
      }
    }
  }

  OpacityMask {
		id: mask_image
		anchors.fill: shootImage
		source: shootImage
		maskSource: maskRec
    invert: true
    visible: isMask
	}

  function magic(target, x, y, change) {
    if(isRuning) return
    isRuning = true
    let res = target.grabToImage((result) => {
      let pic = file.tempDir() + "/clientff_shootcut.png"
      start_x = x
      start_y = y
      result.saveToFile(pic)
      handle = change
      shootcut = pic
    })
    if(!res) change()
  }

  function anima() {
    if(!isRuning) return
    isAnima = true
  }
}