import QtQuick
import QtCore

import utils

import inbox

Item {
    id: root
    state: "Dashboard"
    objectName: "Dashboard"

    signal openReplyPopup(bool isReply, string sender, string subject)

    Main {
        visible: fullSize
        fullSize: (root.state === "Inbox")
        onOpenReplyPopup: function(isReply, sender, subject) {
            root.openReplyPopup(isReply, sender, subject);
        }
    }
}
