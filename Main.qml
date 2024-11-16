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
    width: Style.screenWidth
    height: Style.screenHeight

    Item {
        anchors.fill: parent
        HomePage {
            id: dashboardAppContent
            anchors.fill: parent
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
