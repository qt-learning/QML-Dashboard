// Copyright (C) 2026 Qt Group and its licensors.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

import utils

Item {
    id: root

    property string imageSource: ""

    Image {
        id: stationLogoImage
        anchors.fill: parent
        anchors.margins: Style.resize(5)
        fillMode: Image.PreserveAspectFit
        visible: false
        source: !!imageSource ? Style.gfx("radio_stations/" + root.imageSource) : Style.gfx("radio_stations/station_logo")
    }

    Rectangle {
        id: mask
        anchors.fill: parent
        radius: (width / 2)
        border.color: Style.inactiveColor
    }

    OpacityMask {
        anchors.fill: stationLogoImage
        visible: !!stationLogoImage.source
        source: stationLogoImage
        maskSource: mask
    }
}
