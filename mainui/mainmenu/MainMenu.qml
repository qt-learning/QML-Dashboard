import QtQuick

import utils

Item {
    id: root

    property string currentItemName: mainMenuList.currentItemName
    signal menuItemClicked(var name)

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
            onMenuItemClicked: function(name) {
                root.menuItemClicked(name);
            }
        }
    }

    UserInfo {
        anchors.top: userInfoBg.top
        anchors.topMargin: -Style.resize(38)
        icon: Style.gfx("user")
        name: "John Doe"
        address: qsTr("Barcelona, Spain")
        status: qsTr("Student")
    }
}
