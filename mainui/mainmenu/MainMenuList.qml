import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import utils
import controls

Item {
    id: root
    width: parent.width
    height: Style.resize(402)

    property string currentItemName: menuModel.get(listView.currentIndex).text
    signal menuItemClicked(var name)

    ListModel {
        id: menuModel
        ListElement { text: "Dashboard" }
        ListElement { text: "Inbox" }
        ListElement { text: "Calendar" }
        ListElement { text: "Courses" }
        ListElement { text: "Latest News" }
        ListElement { text: "Web Radio" }
    }

    ListView {
        id: listView
        anchors.fill: parent
        highlight: Item {
            width: parent.width
            height: Style.resize(47)
            Rectangle {
                anchors.fill: parent
                color: Style.bgColor
                opacity: .6
            }
            Rectangle {
                width: Style.resize(4)
                height: parent.height
                color: "#fff"
            }
        }
        spacing: Style.resize(20)
        model: menuModel

        delegate: ItemDelegate {
            width: parent.width
            height: Style.resize(47)
            background: null
            contentItem: Item {
                anchors.fill: parent
                Image {
                    id: iconImage
                    width: Style.resize(sourceSize.width)
                    height: Style.resize(sourceSize.height)
                    anchors.left: parent.left
                    anchors.leftMargin: Style.resize(40)
                    anchors.verticalCenter: parent.verticalCenter
                    source: Style.icon(model.text.toLowerCase())
                    layer.enabled: true
                    layer.effect: ColorOverlay {
                        color: "#fff"
                    }
                }
                Label {
                    anchors.left: iconImage.right
                    anchors.leftMargin: Style.resize(20)
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: Style.resize(3)
                    text: model.text
                    color: "#fff"
                }
            }

            onClicked: {
                listView.currentIndex = index;
                root.menuItemClicked(model.text);
            }
        }
    }
}
