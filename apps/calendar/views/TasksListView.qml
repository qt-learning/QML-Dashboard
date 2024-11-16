import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import controls
import utils

Frame {
    id: root
    width: Style.resize(378)
    height: Style.resize(569)

    property var rootStore
    property var calendarSelectedDate
    signal openNewTaskPopup(var selectedDate)

    background: BaseCard { }

    contentItem: Column {
        id: column
        anchors.fill: parent
        anchors.margins: Style.resize(40)
        spacing: Style.resize(30)
        Row {
            spacing: Style.resize(130)
            Label {
                text: qsTr("Tasks")
                font.pixelSize: Style.fontSizeL
            }
            Button {
                width: Style.resize(107)
                height: Style.resize(35)
                text: qsTr("Add New")
                onClicked: {
                    root.openNewTaskPopup(root.calendarSelectedDate);
                }
            }
        }

        Label {
            font.pixelSize: Style.fontSizeL
            color: Style.mainColor
            font.family: Style.fontFamilyBold
            text: !!root.calendarSelectedDate ? Qt.formatDate(root.calendarSelectedDate, "dd MMM") : ""
        }

        Item {
            width: Style.resize(290)
            height: Style.resize(380)
            clip: true
            ListView {
                id: listView
                anchors.fill: parent
                model: root.rootStore.filterTasksModel(root.calendarSelectedDate.getDate())
                delegate: ItemDelegate {
                    width: (parent.width - Style.resize(5))
                    height: Style.resize(60)
                    background: null
                    contentItem: RowLayout {
                        anchors.fill: parent
                        Label {
                            Layout.preferredWidth: Style.resize(100)
                            text: modelData.time
                            font.pixelSize: Style.fontSizeS
                            color: Style.fontSecondaryColor
                        }
                        Label {
                            Layout.preferredWidth: Style.resize(150)
                            elide: Text.ElideRight
                            text: " " + modelData.text
                            font.pixelSize: Style.fontSizeS
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }

                        ToolButton {
                            Layout.preferredWidth: Style.resize(32)
                            Layout.preferredHeight: Style.resize(32)
                            Layout.alignment: Qt.AlignRight
                            icon.source: Style.icon("close")
                            onClicked: {
                                root.rootStore.removeTask(root.calendarSelectedDate.getDate(), index);
                            }
                        }
                    }

                    onClicked: {
                        listView.currentIndex = index;
                    }
                }
            }
        }
    }
}
