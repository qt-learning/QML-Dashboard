import QtQuick
import QtQuick.Controls

import utils
import webradio

Item {
    id: root
    width: parent.width
    height: (parent.height - Style.resize(450))
    anchors.bottom: parent.bottom

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
        delegate: RadioStationDelegate {
            width: gridView.cellWidth
            height: gridView.cellHeight
        }
    }
}
