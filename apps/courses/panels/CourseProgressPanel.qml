import QtQuick
import QtQuick.Controls

import controls
import utils
import courses

Frame {
    id: root
    width: Style.resize(552)
    height: Style.resize(390)

    background: BaseCard {
        borderImage.border.left: Style.resize(9)
        borderImage.border.right: Style.resize(9)
        borderImage.border.top: Style.resize(9)
        borderImage.border.bottom: Style.resize(9)
    }

    contentItem: Item {
        Label {
            id: titleText
            anchors.top: parent.top
            anchors.topMargin: Style.resize(20)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(40)
            text: qsTr("Course Activity")
            font.pixelSize: Style.fontSizeL
        }

        Label {
            id: subTitleText
            anchors.top: titleText.bottom
            anchors.topMargin: Style.resize(60)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(40)
            text: qsTr("Week 24")
            font.pixelSize: Style.fontSizeL
        }

        HintCard {
            anchors.top: parent.top
            anchors.topMargin: Style.resize(40)
            anchors.right: parent.right
            anchors.rightMargin: Style.resize(20)
            greenIndText: qsTr("Done")
            yellowIndText: qsTr("In Progress")
            redIndText: qsTr("Urgent")
        }

        Row {
            id: progress
            anchors.top: subTitleText.bottom
            anchors.topMargin: Style.resize(50)
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Style.resize(10)
            CircularBar {
                fillColor: "#00D1A8"
                text: qsTr("Due %1%").arg((value*100).toFixed(0))
                value: 1
            }
            CircularBar {
                fillColor: "#FFE361"
                text: qsTr("Due %1%").arg((value*100).toFixed(0))
                value: .25
            }
            CircularBar {
                fillColor: "#FF5900"
                text: qsTr("Due %1%").arg((value*100).toFixed(0))
                value: 1
            }
        }
    }
}
