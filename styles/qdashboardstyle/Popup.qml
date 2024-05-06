import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

import controls
import utils

T.Popup {
    id: root
    implicitWidth: Style.resize(378)
    implicitHeight: Style.resize(366)
    parent: Overlay.overlay
    closePolicy: Popup.NoAutoClose
    background: BaseCard { }
    modal: true
    Overlay.modal: Rectangle {
        color: Qt.rgba(255, 255, 255, 0.6)
    }
    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 100 }
    }
    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 100 }
    }
}
