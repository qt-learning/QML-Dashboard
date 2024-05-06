import QtQuick

import utils
import webradio

Item {
    id: root
    anchors.fill: parent
    anchors.margins: Style.resize(20)

    property bool fullSize
    property RootStore rootStore: RootStore { }

    RadioView {
        id: radioControls
        anchors.left: root.fullSize ? parent.left : undefined
        anchors.leftMargin: root.fullSize ? Style.resize(20) : 0
        fullSize: root.fullSize
        rootStore: root.rootStore
    }

    Item {
        width: (parent.width - Style.resize(529))
        height: Style.resize(450)
        anchors.right: parent.right
        visible: root.fullSize
        Object3DPanel {
            id: musicNote3D
            anchors.centerIn: parent
        }
    }

    RadioStationsView {
        id: radioStationsGrid
        visible: root.fullSize
        rootStore: root.rootStore
    }
}
