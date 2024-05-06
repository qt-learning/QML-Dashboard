import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import controls
import utils
import inbox

Item {
    id: root
    implicitWidth: parent.width
    implicitHeight: contentColumn.height

    property bool fullSize
    property string mailMonth
    property alias model: listView.model

    Column {
        id: contentColumn
        width: parent.width
        spacing: Style.resize(20)

        Label {
            leftPadding: Style.resize(60)
            font.pixelSize: Style.fontSizeL
            font.family: Style.fontFamilyBold
            text: root.mailMonth
        }

        Frame {
            width: parent.width
            height: Style.resize((100 * listView.count) + 40)
            //background:
            contentItem: Item {
                anchors.fill: parent
                anchors {
                    leftMargin: Style.resize(13)
                    rightMargin: Style.resize(13)
                    topMargin: Style.resize(13)
                    bottomMargin: Style.resize(23)
                }
                clip: true
                ListView {
                    id: listView
                    width: parent.width
                    height: parent.height
                    interactive: false
                    delegate: InboxViewDelegate {
                        fullSize: root.fullSize
                    }
                }
            }
        }
    }
}
