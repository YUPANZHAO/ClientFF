import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

import "../image"

CheckBox {
    id: checkBox

    property var boxSize: 16
    property var boxRadius: 4
    property var boxIcon: _RES_ICON_("hook")

    width: boxSize
    height: width

    indicator: Rectangle {
        id: boxRec
        width: boxSize
        height: width
        radius: boxRadius
        color: _THEME_.getColor("box_bg_color")

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: _THEME_.getColor("theme")
            NumberAnimation on opacity {
                to: 1
                running: checkBox.checked
                duration: 100
            }
            NumberAnimation on opacity {
                to: 0
                running: !checkBox.checked
                duration: 100
            }
        }
        border {
            width: checkBox.checked ? 0 : 1
            color: _THEME_.getColor("border")
        }
        ImageSvg {
            image: checkBox.boxIcon
            color: _THEME_.getColor("white")
            anchors.centerIn: parent
            visible: checkBox.checked

            NumberAnimation on size {
                to: boxRec.width * 0.55
                running: checkBox.checked
                duration: 200
            }
            NumberAnimation on size {
                to: 1
                running: !checkBox.checked
                duration: 200
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: checkBox.checked = !checkBox.checked
        }
    }
}