import QtQuick
import QtQuick.Controls

import utils

Popup {
    id: root

    property var selectedDate
    signal addNewTask(bool even, string time, string title);

    contentItem: Item {
        anchors.fill: parent
        Label {
            id: titleLabel
            text: qsTr("New Task")
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
            spacing: Style.resize(50)
            Label {
                id: date
                width: parent.width
                text: !!root.selectedDate ? Qt.formatDate(root.selectedDate, "dd MMM") : ""
                font.family: Style.fontFamilyRegular
                color: Style.mainColor
                font.pixelSize: Style.fontSizeL
            }
            TextField {
                id: desc
                width: parent.width
                placeholderText: qsTr("00:00-00:00 Task Title")
                placeholderTextColor: Style.fontSecondaryColor
                font.family: Style.fontFamilyRegular
                color: Style.fontPrimaryColor
                font.pixelSize: Style.fontSizeM
                background: null
            }
        }
        Button {
            id: saveButton
            width: Style.resize(69)
            height: Style.resize(35)
            anchors.top: contentColumn.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Save")
            enabled: (desc.text !== "")
            onClicked: {
                if (enabled) {
                    var time = desc.text.substring(0,10);
                    var title = desc.text.substring(11,desc.text.length);
                    root.addNewTask(root.selectedDate.getDate()%2 == 0, time, title);
                }
                root.close();
            }
        }
    }
}
