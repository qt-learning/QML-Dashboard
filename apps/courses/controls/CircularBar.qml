import QtQuick
import QtQuick.Controls

import utils

Canvas {
    id: root
    width: Style.resize(150)
    height: Style.resize(150)

    property string text: ""

    Label {
        anchors.centerIn: parent
        text: root.text
    }
}
