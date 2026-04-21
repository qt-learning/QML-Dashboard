// Copyright (C) 2026 Qt Group and its licensors.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

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
}
