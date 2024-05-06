import QtQuick

import utils

Item {
    id: root

    Rectangle {
        id: userInfoBg
        width: parent.width
        height: (parent.height - mainMenuColorFill.height)
        anchors.top: mainMenuColorFill.bottom
        color: "white"
    }

    Rectangle {
        id: mainMenuColorFill
        width: parent.width
        height: Style.resize(878.5)
        color: Style.mainColor
        MainMenuList {
            id: mainMenuList
            anchors.centerIn: parent
        }
    }

    UserInfo {
        anchors.top: userInfoBg.top
        anchors.topMargin: -Style.resize(38)
    }
}
