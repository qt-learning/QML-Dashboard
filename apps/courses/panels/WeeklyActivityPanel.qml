import QtQuick
import QtQuick.Controls

import controls
import utils
import courses

Frame {
    id: root
    width: Style.resize(1104)
    height: Style.resize(455)

    background: BaseCard { }

    contentItem: Item {
        Label {
            id: titleText
            anchors.top: parent.top
            anchors.topMargin: Style.resize(20)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(40)
            text: qsTr("Weekly Activity")
            font.pixelSize: Style.fontSizeL
        }

        //TODO implement graph

        HintCard {
            anchors.top: parent.top
            anchors.topMargin: Style.resize(60)
            anchors.left: graph.right
            anchors.leftMargin: Style.resize(40)
            greenIndText: qsTr("Done")
            yellowIndText: qsTr("In Progress")
            redIndText: qsTr("Urgent")
        }
    }
}
