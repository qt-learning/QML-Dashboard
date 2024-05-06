import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import utils
import controls
import inbox

Item {
    id: root
    anchors.fill: parent

    property bool fullSize
    property RootStore rootStore: RootStore { }
    property int unreadCount: 3
    signal openReplyPopup(bool isReply, string sender, string subject)

    BaseCard {
        anchors.fill: parent
        visible: !root.fullSize
    }

    RowLayout {
        id: topRow
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: Style.resize(20)
        Label {
            id: tileLabel
            leftPadding: Style.resize(40)
            font.pixelSize: Style.fontSizeL
            font.family: Style.fontFamilyBold
            text: qsTr("Inbox (%1)").arg(root.unreadCount)
        }
        Item { Layout.fillWidth: true }
        Button {
            implicitWidth: Style.resize(80)
            implicitHeight: Style.resize(40)
            Layout.rightMargin: Style.resize(40)
            text: qsTr("New")
            onClicked: {
                root.openReplyPopup(false, "", "");
            }
        }
    }

    Flickable {
        anchors {
            left: parent.left
            leftMargin: Style.resize(10)
            right: parent.right
            rightMargin: Style.resize(10)
            top: topRow.bottom
            topMargin: Style.resize(20)
            bottom: parent.bottom
            bottomMargin: Style.resize(30)
        }

        contentHeight: mailsColumn.height - (root.fullSize ? 0 : Style.resize(50))
        clip: true

        Column {
            id: mailsColumn
            width: parent.width
            spacing: 0

            InboxView {
                model: root.rootStore.emailsModel.julyMailsModel
                fullSize: root.fullSize
                mailMonth: qsTr("July")
                onOpenReplyPopup: function(isReply, sender, subject) {
                    root.openReplyPopup(isReply, sender, subject);
                }
            }

            InboxView {
                model: root.rootStore.emailsModel.juneMailsModel
                fullSize: root.fullSize
                mailMonth: qsTr("June")
                onOpenReplyPopup: function(isReply, sender, subject) {
                    root.openReplyPopup(isReply, sender, subject);
                }
            }

            InboxView {
                model: root.rootStore.emailsModel.mayMailsModel
                fullSize: root.fullSize
                mailMonth: qsTr("May")
                onOpenReplyPopup: function(isReply, sender, subject) {
                    root.openReplyPopup(isReply, sender, subject);
                }
            }

            InboxView {
                model: root.rootStore.emailsModel.aprilMailsModel
                fullSize: root.fullSize
                mailMonth: qsTr("April")
                onOpenReplyPopup: function(isReply, sender, subject) {
                    root.openReplyPopup(isReply, sender, subject);
                }
            }
        }
    }
}
