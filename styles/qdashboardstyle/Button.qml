import QtQuick
import QtQuick.Templates as T
import Qt5Compat.GraphicalEffects

import utils

T.Button {
    id: root
    implicitWidth: Style.resize(120)
    implicitHeight: Style.resize(40)

    background: Item {
        anchors.fill: parent
        DropShadow {
            anchors.fill: backgroundFill
            verticalOffset: Style.resize(3)
            radius: Style.resize(8)
            samples: 17
            color: "#80000000"
            source: backgroundFill
        }
        Rectangle {
            id: backgroundFill
            anchors.fill: parent
            radius: Style.resize(30)
            color: (root.pressed || !enabled) ? Style.inactiveColor : Style.mainColor
        }
    }

    contentItem: Item {
        anchors.fill: parent
        Label {
            anchors.centerIn: parent
            color: Style.fontContrastColor
            text: root.text
        }
    }
}
