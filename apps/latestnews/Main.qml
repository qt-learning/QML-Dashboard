import QtQuick
import QtQuick.Controls

import controls
import utils
import latestnews

Frame {
    id: root
    anchors.fill: parent
    clip: true

    property bool fullSize
    property RootStore rootStore: RootStore { }

    background: BaseCard { }

    contentItem: Item {
        Label {
            id: tileTitle
            height: visible ? Style.resize(25) : 0
            visible: !root.fullSize
            anchors.top: parent.top
            anchors.topMargin: Style.resize(20)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(40)
            font.pixelSize: Style.fontSizeL
            text: qsTr("Latest News")
        }

        CategoriesPanel {
            id: categoriesView
            anchors.left: visible ? parent.left : undefined
            anchors.leftMargin: Style.resize(40)
            anchors.right: parent.right
            anchors.rightMargin: visible ? Style.resize(40) : undefined
            width: visible ? parent.width : 0
            height: visible ? Style.resize(60) : 0
            visible: root.fullSize
        }

        NewsItemsView {
            width: (parent.width - Style.resize(40))
            height: (parent.height - categoriesView.height - anchors.topMargin)
            anchors.top: root.fullSize ? categoriesView.bottom : tileTitle.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Style.resize(root.fullSize ? 40 : 30)
            anchors.horizontalCenter: parent.horizontalCenter
            fullSize: root.fullSize
            rootStore: root.rootStore
        }
    }
}
