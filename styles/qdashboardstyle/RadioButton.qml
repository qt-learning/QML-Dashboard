import QtQuick
import QtQuick.Templates as T

import utils

T.RadioButton {
    id: root

    implicitWidth: Style.resize(120)
    implicitHeight: Style.resize(50)
    icon.color: Style.mainColor

    indicator: Rectangle {
        id: indicatorRect
        width: root.height
        height: root.height
        radius: (width / 2)
        color: root.checked ? root.icon.color : Style.inactiveColor
    }

    contentItem: Item {
        width: (parent.width - indicatorRect.width - Style.resize(10))
        height: parent.height
        anchors.left: indicatorRect.right
        anchors.leftMargin: Style.resize(10)
        Label {
            anchors.verticalCenter: parent.verticalCenter
            color: root.checked ? root.icon.color : Style.inactiveColor
            text: root.text
        }
    }
}
