import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import utils
import controls
import inbox

Item {
    id: root
    anchors.fill: parent

    property bool fullSize
    property int unreadCount: 3

    RowLayout {
        id: topRow
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: Style.resize(20)
        Label {
            id: tileLabel
            leftPadding: Style.resize(40)
            font.pixelSize: Style.fontSizeL
            font.family: Style.fontFamilyBold
            text: qsTr("Inbox (%1)").arg(root.unreadCount)
        }
        Item { Layout.fillWidth: true }
        Button {
            implicitWidth: Style.resize(80)
            implicitHeight: Style.resize(40)
            Layout.rightMargin: Style.resize(40)
            text: qsTr("New")
        }
    }
}
