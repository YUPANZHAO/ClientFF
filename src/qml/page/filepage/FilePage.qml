import QtQuick
import QtQuick.Controls

import "../../component/box"
import "../../component/button"
import "../../component/input"
import "../../component/menu"
import "../../component/text"

Item {
  id: filepage

	ScrollView {
		id: scrollview
		anchors.fill: parent
		
		ScrollBar.vertical: ScrollBar{ opacity: 0; width: 0 }
		ScrollBar.horizontal: ScrollBar{ opacity: 0; height: 0 }
		focusPolicy: Qt.ClickFocus

		Pane {
			anchors.fill: parent
			focusPolicy: Qt.ClickFocus
			opacity: 0
		}
		
		Column {
			spacing: 20
			anchors {
				left: parent.left
				top: parent.top
				leftMargin: 20
				topMargin: 20
			}

			EasyBtn {
				id: easyBtn
				text: "点击我"
				onClickedBtn: fixedConfirmBox.confirm("你点击了一次按钮。")
			}

			FixedConfirmBox {
				id: fixedConfirmBox
			}

			InputBox {
				id: inputBox
				hint: "请输入..."
				onTextEnd: (text) => {
					fixedConfirmBox.confirm("你的输入: " + text)
				}
			}

			Rectangle {
				width: 600
				height: 150
				color: _THEME_.getColor("box_bg_color")
				radius: 5
				border {
					width: 1
					color: _THEME_.getColor("theme")
				}
				EasyText {
					text: "右键展开菜单"
					color: _THEME_.getColor("font_light")
					anchors.centerIn: parent
				}
				MouseArea {
					anchors.fill: parent
					acceptedButtons: Qt.RightButton
					onClicked: (mouse) => { easyMenu.open(mouse.x, mouse.y) }
				}
			}

			EasyMenu {
				id: easyMenu
				menuWidth: 110
				property bool showItem3: true
				EasyMenuItem { text: "菜单项 1" }
				EasyMenuItem { text: "菜单项 2" }
				EasyMenuSeparator {}
				EasyMenuItem { 
					text: "菜单项 3"
					showAble: easyMenu.showItem3
				}
				EasyMenu {
					title: "菜单项 4"
					EasyMenuItem { text: "子菜单项 4-1" }
					EasyMenu {
						title: "子菜单项 4-2"
						EasyMenuItem { text: "子菜单项 4-2-1" }
						EasyMenuItem { text: "子菜单项 4-2-2" }
						EasyMenuItem { text: "子菜单项 4-2-3" }
						EasyMenuItem { text: "子菜单项 4-2-4" }
						EasyMenuItem { text: "子菜单项 4-2-5" }
						EasyMenuItem { text: "子菜单项 4-2-6" }
						EasyMenuItem { text: "子菜单项 4-2-7" }
						EasyMenuItem { text: "子菜单项 4-2-8" }
					}
					EasyMenuSeparator {}
					EasyMenuItem { 
						text: easyMenu.showItem3 ? "隐藏菜单项3" : "显示菜单项3"
						onTriggered: {
							easyMenu.showItem3 = !easyMenu.showItem3
						}
					}
				}
				EasyMenuItem { text: "菜单项 5" }
			}

			SwitchBtn {
				id: switchBtn
			}

			EasyComboBox {
				id: easyComboBox
			}


			Row {
				spacing: 30
				EasyCheckBox {
					id: easyCheckBox1
				}
				EasyCheckBox {
					id: easyCheckBox2
					boxRadius: boxSize / 2
				}
			}
		}
	}
}