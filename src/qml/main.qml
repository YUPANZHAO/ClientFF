import QtQuick
import org.wangwenx190.FramelessHelper

Window {
    id: mainWin
    visible: true
    title: "ClientFF"
    width: 800
    height: 500

    Item {
        id: titleBar
        width: parent.width
        height: 36
        Rectangle {
            color: "red"
            anchors.fill: parent
        }
    }

    FramelessHelper {
        id: framelessHelper
        titleBarItem: titleBar
    }
}