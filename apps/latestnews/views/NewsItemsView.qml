import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import utils
import controls

Item {
    id: root
    clip: true

    property var rootStore
    property bool fullSize

    QtObject {
        id: internal
        property int delegateHeight: Style.resize(root.fullSize ? 120 : 95)
    }

    Loader {
        anchors.left: parent.left
        anchors.leftMargin: Style.resize(40)
        anchors.right: parent.right
        anchors.rightMargin: Style.resize(40)
        height: !!item ? item.contentHeight : 0
        anchors.verticalCenter: parent.verticalCenter
        active: (root.rootStore.feedModel.count === 0)
        sourceComponent: Label {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.family: Style.fontFamilyBold
            font.pixelSize: Style.fontSizeL
            color: Style.mainColor
            text: qsTr("Not connected to the Internet or feed cannot be downloaded from source. Please try again later.")
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: root.rootStore.feedModel
        contentHeight: (count * internal.delegateHeight) + (root.fullSize ? Style.resize(60) : 0)
        delegate: ItemDelegate {
            width: !!parent ? parent.width : 0
            height: internal.delegateHeight
            background: null
            contentItem: Item {
                anchors.fill: parent
                Separator {
                    id: divider
                }
                BusyIndicator {
                    anchors.centerIn: parent
                    opacity: root.rootStore.feedLoading ? 1.0 : 0.0
                }
                ColumnLayout {
                    width: parent.width - Style.resize(60)
                    height: Style.resize(root.fullSize ? 95 : 85)
                    anchors.top: divider.bottom
                    anchors.topMargin: Style.resize(root.fullSize ? 10 : 2)
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: root.fullSize ? Style.resize(10) : 0
                    opacity: root.rootStore.feedLoading ? 0.0 : 1.0
                    Behavior on opacity { NumberAnimation { duration: 300 } }
                    RowLayout {
                        Layout.fillWidth: true
                        Layout.preferredHeight: Style.resize(20)
                        Layout.alignment: Qt.AlignVCenter
                        spacing: Style.resize(8)
                        Rectangle {
                            Layout.preferredWidth: (categoryNameLabel.contentWidth + Style.resize(20))
                            Layout.preferredHeight: parent.height
                            radius: Style.resize(30)
                            color: Style.mainColor
                            Label {
                                id: categoryNameLabel
                                anchors.centerIn: parent
                                text: root.rootStore.categoryName
                                color: Style.fontContrastColor
                            }
                        }
                        Label {
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignBottom
                            elide: Text.ElideRight
                            font.pixelSize: Style.fontSizeS
                            text: pubDate
                        }
                    }
                    Label {
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        text: title
                    }
                    Label {
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        color: Style.fontSecondaryColor
                        text: description
                    }
                }
            }
            onClicked: {
                Qt.openUrlExternally(link);
            }
        }
    }
}
