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
            onOpenReplyPopup: function(isReply, sender, subject) {
                popups.openReplyPopup(isReply, sender, subject);
            }
        }
        //Popups
        Popups {
            id: popups
        }
    }
}
