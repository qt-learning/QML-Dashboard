import QtQuick
import QtQuick.Controls

import utils
import controls

Frame {
    id: root
    width: Style.resize(141)
    height: Style.resize(101)

    property string greenIndText
    property string yellowIndText
    property string redIndText

    background: BaseCard {
        borderImage.border.left: Style.resize(9)
        borderImage.border.right: Style.resize(9)
        borderImage.border.top: Style.resize(9)
        borderImage.border.bottom: Style.resize(9)
    }

    contentItem: Column {
        anchors.centerIn: parent
        Row {
            spacing: Style.resize(10)
            Rectangle {
                width: Style.resize(10)
                height: Style.resize(10)
                radius: (width / 2)
                color: "#00D1A8"
            }
            Label {
                text: root.greenIndText
            }
        }
        Row {
            spacing: Style.resize(10)
            Rectangle {
                width: Style.resize(10)
                height: Style.resize(10)
                radius: (width / 2)
                color: "#FF5900"
            }
            Label {
                text: root.redIndText
            }
        }
        Row {
            spacing: Style.resize(10)
            Rectangle {
                width: Style.resize(10)
                height: Style.resize(10)
                radius: (width / 2)
                color: "#FFE361"
            }
            Label {
                text: root.yellowIndText
            }
        }
    }
}
