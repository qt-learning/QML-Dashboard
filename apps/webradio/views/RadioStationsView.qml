import QtQuick
import QtQuick.Controls

import utils
import webradio

Item {
    id: root
    width: parent.width
    height: (parent.height - Style.resize(450))
    anchors.bottom: parent.bottom

    property bool fullSize: false
    property var animator
    property var rootStore

    Label {
        visible: (gridView.count === 0)
        anchors.centerIn: parent
        font.family: Style.fontFamilyBold
        font.pixelSize: Style.fontSizeL
        color: Style.mainColor
        text: qsTr("No Stations Available")
    }

    GridView {
        id: gridView
        width: (cellWidth * 6)
        height: parent.height
        contentHeight: ((cellHeight * count) + Style.resize(331))
        anchors.left: parent.left
        anchors.leftMargin: Style.resize(20)
        cellWidth: Style.resize(256)
        cellHeight: Style.resize(256)
        clip: true
        model: root.rootStore.stationsModel
        currentIndex: root.rootStore.currentStationIndex
        delegate: RadioStationDelegate {
            width: gridView.cellWidth
            height: gridView.cellHeight
            isCurrentStation: (root.rootStore.currentStationIndex === index)
            onClicked: {
                root.rootStore.currentStationIndex = index;
                root.rootStore.play();
                if (root.fullSize) {
                    root.animator.running = true;
                }
            }
        }
    }
}
