import QtQuick
import QtQuick.Controls

import utils

Item {
    id: root

    property alias model: listView.model
    property int selectedCategoryIndex: listView.currentIndex

    ListView {
        id: listView
        width: parent.width
        height: Style.resize(20)
        anchors.verticalCenter: parent.verticalCenter
        orientation: ListView.Horizontal
        spacing: Style.resize(15)
        delegate: Button {
            width: (categoryNameLabel.contentWidth + Style.resize(20))
            height: Style.resize(20)
            background: Rectangle {
                anchors.fill: parent
                radius: Style.resize(30)
                color: (listView.currentIndex === index) ? Style.inactiveColor : Style.mainColor
            }
            contentItem: Label {
                id: categoryNameLabel
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: name
                color: Style.fontContrastColor
            }
            onClicked: {
                listView.currentIndex = index;
            }
        }
    }
}
