// Copyright (C) 2026 Qt Group and its licensors.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtCore

import utils

import inbox as Inbox
import calendar as Calendar

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
}
