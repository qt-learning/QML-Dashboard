import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import utils
import controls

ItemDelegate {
    id: root
    width: parent.width
    height: root.fullSize ? Style.resize(100) : Style.resize(95)
    Behavior on height { NumberAnimation { duration: 50 } }

    property bool fullSize

    background: null
    contentItem: Item {
        anchors.fill: parent
        // ADD Separator
        RowLayout {
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            spacing: Style.resize(30)
            Rectangle {
                Layout.preferredWidth: Style.resize(75)
                Layout.preferredHeight: Style.resize(75)
                Layout.leftMargin: Style.resize(root.fullSize ? 40 : 20)
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: Style.resize(10)
                radius: (width / 2)
                color: "transparent"
                border.color: Style.mainColor
                Label {
                    text: sender.slice(0,1).toUpperCase()
                    font.pixelSize: Style.fontSizeL
                    anchors.centerIn: parent
                    color: Style.mainColor
                }
            }
            Column {
                Layout.preferredWidth: (parent.width - Style.resize(155))
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: Style.resize(10)
                spacing: Style.resize(5)
                Label {
                    font.pixelSize: Style.fontSizeS
                    font.family: Style.fontFamilyBold
                    color: Style.fontPrimaryColor
                    text: sender
                }
                Label {
                    width: parent.width
                    height: Style.resize(14)
                    elide: Text.ElideRight
                    color: Style.fontPrimaryColor
                    text: subject
                }
                Label {
                    id: mailContentItemLabel
                    width: parent.width - Style.resize(20)
                    height: Style.resize(14)
                    font.pixelSize: Style.fontSizeS
                    color: Style.fontSecondaryColor
                    elide: Text.ElideRight
                    wrapMode: Text.NoWrap
                    text: content
                }
            }
        }
        Item {
            width: parent.width
            height: Style.resize(20)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Style.resize(10)

            ToolButton {
                width: Style.resize(90)
                height: Style.resize(30)
                anchors.left: parent.left
                anchors.leftMargin: Style.resize(145)
                anchors.verticalCenter: parent.verticalCenter
                visible: root.fullSize
                text: qsTr("Reply")
                icon.source: Style.icon("reply")
            }
            Image {
                id: expandIcon
                width: Style.resize(14)
                height: Style.resize(14)
                anchors.centerIn: parent
                visible: (root.fullSize && mailContentItemLabel.truncated)
                Behavior on rotation { NumberAnimation { duration: 300 }}
                source: Style.icon("expand")
            }
        }
    }

    onClicked: {
        ListView.view.currentIndex = index;
    }
}
