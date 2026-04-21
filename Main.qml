// Copyright (C) 2026 Qt Group and its licensors.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls

import utils
import popups
import mainui

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
        }
        //Popups
        Popups {
            id: popups
        }
    }
}
