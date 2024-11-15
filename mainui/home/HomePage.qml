import QtQuick
import utils
import mainui

Item {
    id: root

    signal openReplyPopup(bool isReply, string sender, string subject)

    Header {
        id: header
        width: (parent.width - mainMenu.width)
        height: Style.resize(70)
        anchors.left: mainMenu.right
        z: 10000
        menuItemText: mainMenu.currentItemName
        reorderSwitchVisible: (mainMenu.currentItemName === "Dashboard")
    }

    MainMenu {
        id: mainMenu
        width: Style.resize(285)
        height: parent.height
        onMenuItemClicked: function (name) {
            mainContent.state = name;
        }
    }

    Dashboard {
        id: mainContent
        width: (parent.width - mainMenu.width)
        height: (parent.height - header.height)
        anchors.left: mainMenu.right
        anchors.top: header.bottom
        onOpenReplyPopup: function(isReply, sender, subject) {
            root.openReplyPopup(isReply, sender, subject);
        }
    }
}
