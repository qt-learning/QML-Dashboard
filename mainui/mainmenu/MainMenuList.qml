import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import utils
import controls

Item {
    id: root
    width: parent.width
    height: Style.resize(402)

    ListModel {
        id: menuModel
        ListElement { text: "Dashboard" }
        ListElement { text: "Inbox" }
        ListElement { text: "Calendar" }
        ListElement { text: "Courses" }
        ListElement { text: "Latest News" }
        ListElement { text: "Web Radio" }
    }

    ListView {
        id: listView
        anchors.fill: parent
    }
}
