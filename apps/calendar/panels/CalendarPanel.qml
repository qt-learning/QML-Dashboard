import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import utils
import controls

Frame {
    id: root

    property bool fullSize

    background: BaseCard { }

    contentItem: Item {
        anchors.fill: parent
        anchors {
            leftMargin: Style.resize(15)
            rightMargin: Style.resize(15)
            topMargin: Style.resize(10)
            bottomMargin: root.fullSize ? Style.resize(25) : Style.resize(40)
        }
        Label {
            id: title
            width: visible ? Style.resize(105) : 0
            height: visible ? Style.resize(24) : 0
            anchors.top: parent.top
            anchors.topMargin: Style.resize(20)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(40)
            visible: !root.fullSize
            font.pixelSize: Style.fontSizeL
            text: qsTr("Calendar")
        }

        ListView {
            id: calendarList
            anchors.top: title.visible ? title.bottom : parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors {
                leftMargin: Style.resize(40)
                rightMargin: Style.resize(40)
                topMargin: Style.resize(20)
                bottomMargin: Style.resize(20)
            }
            spacing: Style.resize(20)
            orientation: ListView.Horizontal
            clip: true
            model: 12

            delegate: Item {
                width: Style.resize(410)
                height: root.fullSize ? Style.resize(278) : Style.resize(300)

                ColumnLayout {
                    width: parent.width

                    RowLayout {
                        id: navigationLayout
                        Layout.fillWidth: true
                        Layout.preferredHeight: Style.resize(46)
                        Label {
                            font.pixelSize: Style.fontSizeL
                            text: " " /* TODO monthName+year */
                            color: root.fullSize ? Style.fontPrimaryColor : Style.mainColor
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }

                        ToolButton {
                            Layout.preferredWidth: Style.resize(27)
                            Layout.preferredHeight: Style.resize(27)
                            icon.color: undefined
                            icon.source: Style.icon("left")
                            opacity: (calendarList.currentIndex > 0) ? 1 : 0
                            Behavior on opacity { NumberAnimation {}}
                            onClicked: { /* TODO decrement calendar month */ }
                        }

                        Button {
                            Layout.preferredWidth: Style.resize(80)
                            Layout.preferredHeight: Style.resize(30)
                            text: qsTr("Today")
                            onClicked: { /* TODO reset calendar */ }
                        }

                        ToolButton {
                            Layout.preferredWidth: Style.resize(27)
                            Layout.preferredHeight: Style.resize(27)
                            icon.color: undefined
                            icon.source: Style.icon("right")
                            onClicked: { /* TODO increment calendar month */ }
                        }
                    }
                }
            }
        }
    }
}
