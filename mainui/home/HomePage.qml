import QtQuick
import utils
import mainui

Item {
    id: root

    Header {
        id: header
        width: (parent.width - mainMenu.width)
        height: Style.resize(70)
        anchors.left: mainMenu.right
        z: 10000
    }

    MainMenu {
        id: mainMenu
        width: Style.resize(285)
        height: parent.height
    }

    Dashboard {
        id: mainContent
        width: (parent.width - mainMenu.width)
        height: (parent.height - header.height)
        anchors.left: mainMenu.right
        anchors.top: header.bottom
    }
}
