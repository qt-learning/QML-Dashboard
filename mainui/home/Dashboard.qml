import QtQuick
import QtCore

import utils

import inbox as Inbox
import calendar as Calendar
import courses as Courses

Item {
    id: root
    state: "Dashboard"
    objectName: "Dashboard"

    signal openNewReminderPopup()
    signal openNewTaskPopup(var selectedDate)
    signal openReplyPopup(bool isReply, string sender, string subject)

    Inbox.Main {
        visible: fullSize
        fullSize: (root.state === "Inbox")
        onOpenReplyPopup: function (isReply, sender, subject) {
            root.openReplyPopup(isReply, sender, subject);
        }
    }

    Calendar.Main {
        visible: fullSize
        fullSize: (root.state === "Calendar")
        onOpenNewReminderPopup: function() {
            root.openNewReminderPopup();
        }
        onOpenNewTaskPopup: function(selectedDate) {
            root.openNewTaskPopup(selectedDate);
        }
    }

    Courses.Main {
        visible: fullSize
        fullSize: (root.state === "Courses")
        onOpenNewReminderPopup: {
            root.openNewReminderPopup();
        }
    }
}
