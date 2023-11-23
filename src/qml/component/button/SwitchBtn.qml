import QtQuick
import QtQuick.Controls

Switch {
    id: switchBtn

    checked: true
    property var btnWidth: 38
    property var btnHeight: 20
    property var animaDuration: 200

    width: btnWidth
    height: btnHeight

    indicator: Rectangle {
        width: btnWidth
        height: btnHeight
        radius: height / 2

        ColorAnimation on color {
            to: _THEME_.getColor("theme")
            running: switchBtn.checked
            duration: animaDuration / 2
        }

        ColorAnimation on color {
            to: _THEME_.getColor("box_bg_color_highlight")
            running: !switchBtn.checked
            duration: animaDuration / 2
        }
        
        Rectangle {
            id: point
            width: btnHeight * 0.8
            height: width
            radius: height / 2
            color: _THEME_.getColor("white")
            anchors.verticalCenter: parent.verticalCenter

            NumberAnimation on x {
                to: btnWidth - btnHeight * 0.9
                running: switchBtn.checked
                duration: animaDuration
                easing.type: Easing.InOutSine
            }

            NumberAnimation on x {
                to: btnHeight * 0.1
                running: !switchBtn.checked
                duration: animaDuration
                easing.type: Easing.InOutSine
            }
        }
    }
}