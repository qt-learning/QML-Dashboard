import QtQuick
import QtQuick.Controls

import utils
import popups

Item {
    id: root
    anchors.fill: parent

    function openReplyPopup(isReply, sender, subject) {
        popupLoader.sourceComponent = newOrReplyEmailPopupComponent;
        if (isReply) {
            popupLoader.item.isReply = isReply;
            popupLoader.item.sender = sender;
            popupLoader.item.subject = subject;
        }
        popupLoader.item.open();
    }

    function openNewTaskPopup(selectedDate) {
        popupLoader.sourceComponent = newTaskPopupComponent;
        popupLoader.item.selectedDate = selectedDate;
        popupLoader.item.open();
    }

    function openNewReminderPopup() {
        popupLoader.sourceComponent = newReminderPopupComponent;
        popupLoader.item.open();
    }

    signal newTaskAdded(bool even, string time, string title)
    signal newReminderAdded(string day, string month, string description, string color)

    Loader {
        id: popupLoader
        anchors.fill: parent
    }

    Component {
        id: newOrReplyEmailPopupComponent
        NewOrReplyEmailPopup {
            id: newOrReplyEmailPopup
            anchors.centerIn: parent
            onClosed: { popupLoader.sourceComponent = null; }
        }
    }

    Component {
        id: newTaskPopupComponent
        NewTaskPopup {
            id: newTaskPopup
            anchors.centerIn: parent
            onAddNewTask: function(even, time, title) {
                root.newTaskAdded(even, time, title);
            }
            onClosed: { popupLoader.sourceComponent = null; }
        }
    }

    Component {
        id: newReminderPopupComponent
        NewReminderPopup {
            id: newReminderPopup
            anchors.centerIn: parent
            onNewReminderAdded: function(day, month, description, color) {
                root.newReminderAdded(day, month, description, color);
            }
            onClosed: { popupLoader.sourceComponent = null; }
        }
    }
}
