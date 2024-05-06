import QtQuick
import QtQuick.Controls

import utils

Row {
    id: root
    width: Style.resize(120)
    height: Style.resize(30)
    spacing: Style.resize(10)

    property bool playbackStatePlaying: false
    signal playPauseClicked()
    signal previousClicked()
    signal nextClicked()
    signal stopClicked()

    ToolButton {
        width: Style.resize(30)
        height: Style.resize(30)
        icon.color: undefined
        icon.source: Style.icon("previous")
        onClicked: {
            root.previousClicked();
        }
    }

    ToolButton {
        width: Style.resize(30)
        height: Style.resize(30)
        icon.color: undefined
        icon.source: root.playbackStatePlaying ? Style.icon("pause") : Style.icon("play")
        onClicked: { root.playPauseClicked(); }
    }

    ToolButton {
        width: Style.resize(30)
        height: Style.resize(30)
        icon.color: undefined
        icon.source: Style.icon("stop")
        onClicked: { root.stopClicked(); }
    }

    ToolButton {
        width: Style.resize(30)
        height: Style.resize(30)
        icon.color: undefined
        icon.source: Style.icon("next")
        onClicked: { root.nextClicked(); }
    }
}
