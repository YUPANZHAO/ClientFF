import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Basic

import "../text"
import "../image"

ComboBox {
    id: comboBox

    property var boxWidth: 120
    property var boxHeight: 26
    property var boxRadius: 4
    property var itemPadding: 5
    property var itemHeight: 24
    model: [{text: "Banana"}, {text: "Apple"}, {text: "Coconut"}]
    displayText: ""
    width: boxWidth
    height: boxHeight

    background: Rectangle {
        id: boxRec
        
        width: boxWidth
        height: boxHeight
        radius: boxRadius
        color: _THEME_.getColor("bg_light")

        border {
            width: 1
            color: _THEME_.getColor("border")
        }
    }

    indicator: Item {
        width: boxWidth
        height: boxHeight

        EasyText {
            text: comboBox.currentText
            fontSize: boxHeight * 0.5
            elide: Text.ElideRight
            wrapMode: Text.NoWrap
            width: boxWidth - arrowImg.size - 15 
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
        }

        ImageSvg {
            id: arrowImg
            image: _RES_ICON_("arrow")
            size: boxHeight * 0.3
            rotation: 90
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 10
            }
        }
    }



    popup: Popup {
        id: myPopup
        
        x: 0
        y: boxRec.height + 6
        leftInset: 0
        rightInset: 0
        topInset: 0
        bottomInset: 0
        padding: itemPadding
        
        background: Item {
            width: boxWidth

            DropShadow {
                anchors.fill: popRec
                horizontalOffset: 0
                verticalOffset: 0
                radius: 16
                samples: 32
                color: _THEME_.getColor("shadow")
                source: popRec
            }

            Rectangle {
                id: popRec
                anchors.fill: parent
                radius: boxRadius
                color: _THEME_.getColor("bg_light")
            }
        }

        contentItem: Column {
            id: poplist
            spacing: itemPadding
            Repeater {
                model: comboBox.model
                Rectangle {
                    id: itemRec
                    width: boxWidth - 2 * itemPadding
                    height: itemHeight
                    radius: boxRadius
                    color: _THEME_.getColor(comboBox.currentIndex == index || itemArea.containsPress ? "box_bg_color_highlight" : itemArea.containsMouse ? "box_bg_color" : "bg_light")

                    MouseArea {
                        id: itemArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            comboBox.currentIndex = index
                            myPopup.close()
                        }
                    }

                    EasyText {
                        anchors {
                            left: parent.left
                            leftMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        text: modelData.text
                        fontSize: itemHeight * 0.5
                        elide: Text.ElideRight
                        wrapMode: Text.NoWrap
                        width: parent.width - hookImg.size - 15 
                    }

                    ImageSvg {
                        id: hookImg
                        image: _RES_ICON_("hook")
                        size: itemHeight * 0.3
                        visible: comboBox.currentIndex == index
                        anchors {
                            verticalCenter: parent.verticalCenter
                            right: parent.right
                            rightMargin: 10
                        }
                    }
                }
            }
        }
    }

}