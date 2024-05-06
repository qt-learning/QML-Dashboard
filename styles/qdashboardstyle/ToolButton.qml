import QtQuick
import QtQuick.Templates as T
import Qt5Compat.GraphicalEffects

import utils

T.ToolButton {
    id: root

    implicitWidth: Style.resize(140)
    implicitHeight: Style.resize(40)
    icon.color: Style.mainColor

    background: Item {
        id: background
        anchors.fill: parent
        Image {
            id: iconImg
            width: Style.resize(sourceSize.width)
            height: Style.resize(sourceSize.height)
            anchors.verticalCenter: parent.verticalCenter
            source: icon.source
            layer.enabled: !!root.icon.color
            layer.effect: ColorOverlay {
                color: root.icon.color
            }
        }
    }

    contentItem: Item {
        width: (parent.width - iconImg.width)
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: (iconImg.width > 0) ? (iconImg.width + Style.resize(10)) : 0
        Label {
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            text: root.text
            color: root.pressed ? Style.mainColor : Style.inactiveColor
        }
    }
}
