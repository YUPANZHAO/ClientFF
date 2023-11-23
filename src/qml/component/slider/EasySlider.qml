import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Slider {
    id: slider

    property var lineWidth: 150
    property var lineHeight: 6
    property var handleRadius: 7
    
    readonly property var isV: orientation == Qt.Vertical

    width: isV ? Math.max(lineHeight, handleRadius * 2) : lineWidth
    height: isV ? lineWidth : Math.max(lineHeight, handleRadius * 2)
    padding: 0

    background: Item {
        width: parent.width
        height: parent.height
        
        Rectangle {
            id: bgLine
            width: isV ? lineHeight : lineWidth
            height: isV ? lineWidth : lineHeight
            radius: isV ? width / 2 : height / 2
            color: _THEME_.getColor("box_bg_color_highlight")
            anchors.centerIn: parent
        }

        Rectangle {
            width: isV ? lineHeight : slider.visualPosition * lineWidth
            height: isV ? (1.0 - slider.visualPosition) * lineWidth : lineHeight
            radius: isV ? width / 2 : height / 2
            color: _THEME_.getColor("theme")
            anchors.left: bgLine.left
            anchors.bottom: bgLine.bottom
        }
    }

    handle: Item {
        width: handleRadius * 2
        height: width
        
        x: isV ? slider.leftPadding + slider.availableWidth / 2 - width / 2 : slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
        y: isV ? (slider.bottomPadding + slider.visualPosition * (slider.availableHeight - height)) : slider.topPadding + slider.availableHeight / 2 - height / 2

        Rectangle {
            anchors.fill: parent
            radius: handleRadius
            color: _THEME_.getColor("white")
            border {
                width: 1
                color: _THEME_.getColor("border")
            }
        }
    }
}