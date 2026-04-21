// Copyright (C) 2026 Qt Group and its licensors.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

import utils

Item {
    id: root

    property alias borderImage: borderImage

    BorderImage {
        id: borderImage
        anchors.fill: parent
        source: Style.gfx("card")
        border.left: Style.resize(100)
        border.right: Style.resize(100)
        border.top: Style.resize(100)
        border.bottom: Style.resize(100)
    }
}
