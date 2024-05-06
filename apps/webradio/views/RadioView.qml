import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import controls
import utils
import webradio

Frame {
    id: root
    width: Style.resize(529)
    height: Style.resize(455)

    property bool fullSize
    property var rootStore

    background: BaseCard { }

    contentItem: ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: Style.resize(40)
        anchors.leftMargin: Style.resize(40)
        anchors.rightMargin: Style.resize(40)
        anchors.bottomMargin: Style.resize(60)
        spacing: Style.resize(20)

        Label {
            font.pixelSize: Style.fontSizeL
            text: root.fullSize ? qsTr("Player") : qsTr("Web Radio")
        }

        RadioStationLogo {
            Layout.preferredWidth: Style.resize(130)
            Layout.preferredHeight: Style.resize(130)
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            id: stationNameLabel
            Layout.preferredWidth: Style.resize(480)
            Layout.preferredHeight: Style.resize(25)
            Layout.alignment: Qt.AlignHCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            color: Style.fontSecondaryColor
        }

        Label {
            Layout.preferredHeight: Style.resize(25)
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: -Style.resize(10)
            font.family: Style.fontFamilyBold
            font.pixelSize: Style.fontSizeL
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            color: Style.mainColor
            text: qsTr("Could not open stream")
        }

        RadioControlsPanel {
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            Layout.preferredWidth: Style.resize(170)
            Layout.preferredHeight: Style.resize(20)
            Layout.alignment: Qt.AlignHCenter
            spacing: Style.resize(10)
            Image {
                Layout.preferredWidth: Style.resize(sourceSize.width)
                Layout.preferredHeight: Style.resize(sourceSize.height)
                Layout.alignment: Qt.AlignVCenter
                source: Style.icon("speaker")
            }
            Slider {
                Layout.preferredHeight: Style.resize(8)
                from: 0
                to: 1
                value: 1
            }
        }
    }
}
