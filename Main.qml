import QtQuick
import QtQuick.Controls

import utils
import popups
import mainui
import commonstores

ApplicationWindow {
    id: root
    visible: true
    color: Style.bgColor
    title: qsTr("QML Dashboard")

    readonly property real currentAspectRatio: (root.width / root.height)

    Component.onCompleted: {
        root.width = Style.screenWidth;
        root.height = Style.screenHeight;
    }

    Item {
        anchors.fill: parent
        HomePage {
            id: dashboardAppContent

            onWidthChanged: {
                Style.scaleFactor = (width / Style.screenWidth);
            }
            states: [
                State {
                    name: "screenWidthBoundaries"
                    when: (root.currentAspectRatio > Style.designAspectRatio)
                    PropertyChanges {
                        target: dashboardAppContent
                        width: Math.round(root.height * Style.designAspectRatio)
                        height: root.height
                    }
                },
                State {
                    name: "screenHeightBoundaries"
                    when: (root.currentAspectRatio <= Style.designAspectRatio)
                    PropertyChanges {
                        target: dashboardAppContent
                        width: root.width
                        height: root.height
                    }
                }
            ]

            onOpenNewReminderPopup: function() {
                popups.openNewReminderPopup();
            }
            onOpenNewTaskPopup: function(selectedDate) {
                popups.openNewTaskPopup(selectedDate);
            }
            onOpenReplyPopup: function(isReply, sender, subject) {
                popups.openReplyPopup(isReply, sender, subject);
            }
        }
        //Popups
        Popups {
            id: popups
            onNewTaskAdded: function(even, time, title) {
                Store.addNewTask(even, time, title);
            }
            onNewReminderAdded: function(day, month, description, color) {
                Store.addNewReminder(day, month, description, color);
            }
        }
    }
}
