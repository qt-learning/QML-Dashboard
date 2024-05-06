import QtQuick
import QtQuick.Controls

import utils
import controls

Popup {
    id: root
    width: Style.resize(1203)
    height: Style.resize(590)

    property bool isReply: false
    property string sender: ""
    property string subject: ""

    contentItem: Item {
        anchors.fill: parent
        anchors {
            leftMargin: Style.resize(20)
            rightMargin: Style.resize(20)
            topMargin: Style.resize(40)
            bottomMargin: Style.resize(40)
        }
        Item {
            id: emailAddressItem
            width: parent.width
            height: Style.resize(80)
            Row {
                anchors.fill: parent
                leftPadding: Style.resize(20)
                spacing: Style.resize(5)
                Label {
                    id: indLabel
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    text: root.isReply ? qsTr("Reply ") : qsTr("To ")
                }
                Label {
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    visible: root.isReply
                    color: Style.fontSecondaryColor
                    text: qsTr("to: ") + root.sender
                }
                TextInput {
                    id: emailAddressTextInput
                    width: (parent.width - indLabel.contentWidth - Style.resize(10))
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    visible: !root.isReply
                    font.family: Style.fontFamilyRegular
                    color: Style.fontSecondaryColor
                    font.pixelSize: Style.fontSizeM
                }
            }
            ToolButton {
                width: Style.resize(32)
                height: Style.resize(32)
                anchors.right: parent.right
                anchors.rightMargin: Style.resize(20)
                anchors.verticalCenter: parent.verticalCenter
                icon.source: Style.icon("close");
                onClicked: { root.close(); }
            }
            Separator {
                anchors.bottom: parent.bottom
            }
        }
        Item {
            id: subjectItem
            width: parent.width
            height: Style.resize(80)
            anchors.top: emailAddressItem.bottom
            TextInput {
                id: subjectTextInput
                leftPadding: Style.resize(20)
                width: (parent.width - leftPadding)
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                text: root.isReply ? qsTr("Re: ") + root.subject : ""
                font.family: Style.fontFamilyRegular
                color: Style.mainColor
                font.pixelSize: Style.fontSizeM
            }
            Separator {
                anchors.bottom: parent.bottom
            }
        }
        Item {
            width: parent.width
            anchors.top: subjectItem.bottom
            anchors.bottom: sendButton.top
            TextInput {
                id: contentTextField
                anchors.fill: parent
                anchors.margins: Style.resize(20)
                font.family: Style.fontFamilyRegular
                color: Style.fontPrimaryColor
                wrapMode: Text.WordWrap
                font.pixelSize: Style.fontSizeS
            }
        }
        Button {
            id: sendButton
            width: Style.resize(71)
            height: Style.resize(35)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(20)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Style.resize(20)
            enabled: (root.isReply || (!root.isReply && emailAddressTextInput.text !== ""))
            text: qsTr("Send")
            onClicked: {
                root.close();
            }
        }
    }
}
