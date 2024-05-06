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

    ListView {
        id: listView
        anchors.fill: parent
        //model:
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
                ColumnLayout {
                    width: parent.width - Style.resize(60)
                    height: Style.resize(root.fullSize ? 95 : 85)
                    anchors.top: divider.bottom
                    anchors.topMargin: Style.resize(root.fullSize ? 10 : 2)
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: root.fullSize ? Style.resize(10) : 0
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
                                //text:
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
        }
    }
}
