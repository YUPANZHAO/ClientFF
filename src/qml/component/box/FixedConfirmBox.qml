import QtQuick

import "../box"
import "../button"
import "../text"

FixedWindowBox {
  id: fixedConfirmBox
  
  property var showTitle: "窗口标题"
  property var showText: "显示文本..."
  property var checkBtnText: "确认"
  property var leftPadding: 20
  property var rightPadding: leftPadding
  property var topPadding: 20
  property var bottomPadding: 10

  function confirm(text, title="提示", btnText="确认") {
    showTitle = title
    showText = text
    checkBtnText = btnText
    fixedConfirmBox.show()
  }

  modality: Qt.ApplicationModal

  content: Item {
    width: 300
    height: texts.height + checkBtn.height + fixedConfirmBox.bottomPadding
    
    Column {
      id: texts
      spacing: 15
      topPadding: fixedConfirmBox.topPadding
      leftPadding: fixedConfirmBox.leftPadding
      rightPadding: fixedConfirmBox.rightPadding
      bottomPadding: fixedConfirmBox.bottomPadding
      width: parent.width

      property var paddingOffset: fixedConfirmBox.leftPadding + fixedConfirmBox.rightPadding

      EasyText {
        text: showTitle
        font.weight: Font.Medium
        elide: Text.ElideRight
        wrapMode: Text.NoWrap
        width: parent.width - parent.paddingOffset
      }
      EasyText {
        text: showText
        width: parent.width - parent.paddingOffset
      }
    }
    EasyBtn {
      id: checkBtn
      text: checkBtnText
      anchors {
        right: parent.right
        bottom: parent.bottom
        rightMargin: fixedConfirmBox.rightPadding
        bottomMargin: fixedConfirmBox.bottomPadding
      }
      onClickedBtn: fixedConfirmBox.close()
    }
  }
}