import QtQuick
import QtQuick.Templates as T

import utils

T.Switch {
    id: root

    implicitWidth: Style.resize(170)
    implicitHeight: Style.resize(30)

    background: Rectangle {
        id: background
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        border.color: Style.inactiveColor
        radius: width / 3
    }

    indicator: Rectangle {
        id: indicator
        width: background.width / 2
        height: parent.height
        color: Style.mainColor
        radius: width / 2
        x: root.checked ? (background.width - width) : 0
        Behavior on x {
            NumberAnimation { properties: "x"; easing.type: Easing.InOutQuad; duration: 200 }
        }
    }

    contentItem: Item {
        width: (parent.width - background.width - Style.resize(10))
        height: parent.height
        anchors.left: background.right
        anchors.leftMargin: Style.resize(10)
        Label {
            anchors.verticalCenter: parent.verticalCenter
            color: Style.inactiveColor
            text: root.text
        }
    }
}
