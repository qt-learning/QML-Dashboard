import QtQuick
import QtQuick.Templates as T

import utils

T.Slider {
    id: root

    implicitWidth: Style.resize(170)
    implicitHeight: Style.resize(20)

    background: Rectangle {
        width: parent.width
        height: (parent.height / 4)
        anchors.verticalCenter: parent.verticalCenter
        radius: Style.resize(20)
        color: Style.inactiveColor
        Rectangle {
            width: (root.value * parent.width)
            height: parent.height
            color: Style.mainColor
            radius: Style.resize(20)
        }
    }

    handle: Rectangle {
        property int calcDim: (root.height < Style.resize(10)) ? root.height : (root.height / 2)
        width: calcDim
        height: calcDim
        anchors.verticalCenter: parent.verticalCenter
        x: (root.value * (root.width - calcDim))
        radius: (width / 2)
        color: Style.mainColor
    }
}
