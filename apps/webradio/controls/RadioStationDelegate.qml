import QtQuick
import QtQuick.Controls

import controls
import utils
import webradio

ItemDelegate {
    id: root

    property bool isCurrentStation: false

    background: BaseCard {
        anchors.fill: parent
    }

    contentItem: Item {
        anchors.fill: background

        RadioStationLogo {
            id: stationLogo
            width: Style.resize(82)
            height: Style.resize(82)
            anchors.top: parent.top
            anchors.topMargin: Style.resize(35)
            anchors.horizontalCenter: parent.horizontalCenter
            imageSource: image
        }

        Image {
            id: note
            width: Style.resize(30)
            height: Style.resize(32)
            anchors.right: stationLogo.right
            anchors.top: stationLogo.top
            visible: root.isCurrentStation
            fillMode: Image.PreserveAspectFit
            source: Style.icon("music_note_" + Style.theme)
        }

        Column {
            width: (parent.width - Style.resize(40))
            anchors.top: stationLogo.bottom
            anchors.topMargin: Style.resize(20)
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Style.resize(10)
            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                color: root.isCurrentStation ? Style.mainColor : Style.fontPrimaryColor
                text: name + ", " + country
            }
            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                color: Style.fontSecondaryColor
                text: website
            }
        }
    }
}
