import QtQuick
import QtQuick.Controls
import QtQml.Models

import "../image"
import "../text"

Item {
    id: tipBox

    property var tipTextSize: 14
    property var tipItemPadding: 8
    property var tipItemHPadding: tipItemPadding
    property var tipItemVPadding: tipItemPadding
    property var tipComSpacing: tipItemPadding
    property var tipItemRadius: 4
    property var topInterval: 15
    property var animaDuration: 240
    property var maxItemCount: 5
    property var deadTime: 1500

    function tip(text="Tip", iconSource="", iconSize=0, iconColor="") {
        tipModel.insert(0, {tipTextStr: text, iconSource: iconSource, iconSize: iconSize, iconColor: iconColor})
        if(tipModel.count > maxItemCount) {
            tipModel.remove(maxItemCount, 1)
        }
    }

    function info(text) {
        tip(text, _RES_ICON_("tip-info.svg"), tipTextSize, _THEME_.getColor("tip_info_color"))
    }

    function warn(text) {
        tip(text, _RES_ICON_("tip-warn.svg"), tipTextSize, _THEME_.getColor("tip_warn_color"))
    }

    ListModel {
        id: tipModel
    }

    ListView {
        id: tipView
        model: tipModel
        delegate: tipDelegate
        spacing: 10
        enabled: false
        anchors {
            fill: parent
            top: parent.top
            topMargin: topInterval
        }
        add: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1; duration: animaDuration; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "y"; from: -50; duration: animaDuration; easing.type: Easing.InOutSine }
        }
        addDisplaced: Transition {
            NumberAnimation { property: "opacity"; to: 1; duration: animaDuration; }
            NumberAnimation { properties: "x,y"; duration: animaDuration; }
        }
        remove: Transition {
            NumberAnimation { property: "opacity"; to: 0; duration: animaDuration; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "y"; to: -50; duration: animaDuration; easing.type: Easing.InOutSine }
        }
        removeDisplaced: Transition {
            NumberAnimation { property: "opacity"; to: 0; duration: animaDuration }
            NumberAnimation { properties: "y"; to: -50; duration: animaDuration }
        }
    }

    Component {
        id: tipDelegate
            
        Rectangle {
            id: tipRec

            Component.onDestruction: {
                autoCloseTimer.stop()
            }

            anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined
            radius: tipItemRadius
            color: _THEME_.getColor("box_bg_color")
            width: tipCom.width + tipItemHPadding * 2
            height: tipCom.height + tipItemVPadding * 2
            border {
                width: 1
                color: _THEME_.getColor("border")
            }

            Row {
                id: tipCom
                anchors.centerIn: parent
                spacing: tipComSpacing
                ImageSvg {
                    image: iconSource
                    size: iconSize
                    color: iconColor
                    anchors.verticalCenter: parent.verticalCenter
                }
                EasyText {
                    id: tipText
                    text: tipTextStr
                    fontSize: tipTextSize
                }
            }
            Timer {
                id: autoCloseTimer
                running: true
                interval: deadTime
                onTriggered: () => {
                    if(index >= 0) tipModel.remove(index, 1)
                }
            }
        }
    }
}