import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import utils

Item {
    id: root

    DropShadow {
        anchors.fill: backgroundColor
        verticalOffset: Style.resize(3)
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: backgroundColor
    }

    Rectangle {
        id: backgroundColor
        width: parent.width
        height: parent.height
        anchors.right: parent.right
        color: "#fff"
    }

    Loader {
        id: dropDownMenuLoader
        width: Style.resize(228)
        height: Style.resize(127)
        anchors.top: parent.top
        anchors.topMargin: ((height / 2) + Style.resize(10))
        anchors.right: parent.right
        anchors.rightMargin: Style.resize(45)
        active: false
        opacity: active ? 1.0 : 0.0
        visible: (opacity > 0.0)
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }
}
