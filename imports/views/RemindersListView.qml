import QtQuick
import QtQuick.Controls

import controls
import utils

Frame {
    id: root
    width: Style.resize(378)
    height: Style.resize(455)

    property var rootStore
    signal openNewReminderPopup()

    background: BaseCard {
        borderImage.border.left: Style.resize(9)
        borderImage.border.right: Style.resize(9)
        borderImage.border.top: Style.resize(9)
        borderImage.border.bottom: Style.resize(9)
    }

    contentItem: Column {
        anchors.fill: parent
        anchors.margins: Style.resize(20)
        spacing: Style.resize(20)
        Row {
            spacing: Style.resize(105)
            Label {
                text: qsTr("Reminders")
                font.pixelSize: Style.fontSizeL
            }
            Button {
                width: Style.resize(107)
                height: Style.resize(35)
                text: qsTr("Add New")
                onClicked: {
                    root.openNewReminderPopup();
                }
            }
        }
        ListView {
            id: listView
            width: parent.width
            height: Style.resize(339)
            spacing: Style.resize(15)
            model: root.rootStore.remindersModel

            delegate: ItemDelegate {
                width: parent.width
                height: Style.resize(57)
                background: null
                contentItem: Item {
                    Column {
                        id: dateColumn
                        width: Style.resize(60)
                        height: childrenRect.height
                        anchors.verticalCenter: parent.verticalCenter
                        Label {
                            text: model.date
                            color: Style.fontSecondaryColor
                            font.pixelSize: Style.fontSizeL
                        }
                        Label {
                            text: model.month
                        }
                    }
                    Label {
                        id: descLabel
                        width: Style.resize(220)
                        anchors.left: dateColumn.right
                        anchors.leftMargin: Style.resize(20)
                        anchors.verticalCenter: parent.verticalCenter
                        elide: Text.ElideRight
                        text: model.description
                    }
                    Rectangle {
                        width: Style.resize(10)
                        height: Style.resize(10)
                        x: descLabel.x + descLabel.contentWidth
                        y: Style.resize(15)
                        radius: width / 2
                        color: model.color
                    }
                }

                onClicked: {
                    listView.currentIndex = index;
                }
            }
        }
    }
}
