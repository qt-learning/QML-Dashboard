import QtQuick
import QtQuick.Controls

import utils

Popup {
    id: root

    signal newReminderAdded(string day, string month, string description, string color)

    contentItem: Item {
        anchors.fill: parent
        Label {
            id: titleLabel
            text: qsTr("New Reminder")
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(50)
            anchors.top: parent.top
            anchors.topMargin: Style.resize(50)
        }
        ToolButton {
            width: Style.resize(32)
            height: Style.resize(32)
            anchors.top: parent.top
            anchors.topMargin: Style.resize(20)
            anchors.right: parent.right
            anchors.rightMargin: Style.resize(40)
            icon.color: undefined
            icon.source: Style.icon("close")
            onClicked: { root.close(); }
        }
        Column {
            id: contentColumn
            width: parent.width
            height: Style.resize(200)
            anchors.top: titleLabel.bottom
            padding: Style.resize(50)
            spacing: Style.resize(10)
            TextField {
                id: date
                width: (parent.width - Style.resize(90))
                placeholderText: qsTr("Date")
                font.family: Style.fontFamilyRegular
                color: Style.inactiveColor
                font.pixelSize: Style.fontSizeL
                background: null
            }
            TextField {
                id: desc
                width: (parent.width - Style.resize(90))
                placeholderText: qsTr("Description")
                font.family: Style.fontFamilyRegular
                color: Style.inactiveColor
                font.pixelSize: Style.fontSizeM
                background: null
            }
            Row {
                id: prio
                property string prioColor
                RadioButton {
                    id: doneRadioButton
                    width: Style.resize(80)
                    height: Style.resize(14)
                    icon.color: "#00D1A8"
                    text: qsTr("Done")
                    onClicked: { prio.prioColor = "#00D1A8"; }
                }
                RadioButton {
                    id: inProgressRadioButton
                    width: Style.resize(130)
                    height: Style.resize(14)
                    icon.color: "#FFE361"
                    text: qsTr("In Progress")
                    onClicked: { prio.prioColor = "#FFE361"; }
                }
                RadioButton {
                    id: urgentRadioButton
                    width: Style.resize(80)
                    height: Style.resize(14)
                    icon.color: "#FF5900"
                    text: qsTr("Urgent")
                    onClicked: { prio.prioColor = "#FF5900"; }
                }
            }
        }
        Button {
            id: saveButton
            width: Style.resize(69)
            height: Style.resize(35)
            anchors.top: contentColumn.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Save")
            enabled: (date.text !== "" && desc.text !== "" && prio.prioColor !== "")
            onClicked: {
                if (date.text !== "" && desc.text !== "" ) {
                    var monthDay = date.text.split(" ");
                    var day = monthDay[0];
                    var month = monthDay[1];
                    root.newReminderAdded(day, month, desc.text, prio.prioColor);
                }
                root.close();
            }
        }
    }
}
