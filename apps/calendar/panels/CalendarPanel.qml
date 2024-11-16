import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import utils
import controls

Frame {
    id: root

    property bool fullSize
    property var reminderData
    property var currentDate: new Date()
    property var selectedDate: root.currentDate
    property int currentMonth: root.currentDate.getMonth()

    function resetCalendar() {
        root.selectedDate = root.currentDate;
        calendarList.currentIndex = root.currentMonth;
        calendarList.positionViewAtIndex(calendarList.currentIndex, ListView.Beginning);
    }

    background: BaseCard { }

    contentItem: Item {
        anchors.fill: parent
        anchors {
            leftMargin: Style.resize(15)
            rightMargin: Style.resize(15)
            topMargin: Style.resize(10)
            bottomMargin: root.fullSize ? Style.resize(25) : Style.resize(40)
        }
        Label {
            id: title
            width: visible ? Style.resize(105) : 0
            height: visible ? Style.resize(24) : 0
            anchors.top: parent.top
            anchors.topMargin: Style.resize(20)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(40)
            visible: !root.fullSize
            font.pixelSize: Style.fontSizeL
            text: qsTr("Calendar")
        }

        ListView {
            id: calendarList
            anchors.top: title.visible ? title.bottom : parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors {
                leftMargin: Style.resize(40)
                rightMargin: Style.resize(40)
                topMargin: Style.resize(20)
                bottomMargin: Style.resize(20)
            }
            spacing: Style.resize(20)
            orientation: ListView.Horizontal
            clip: true
            model: 12
            highlightMoveDuration: 1
            highlightRangeMode: ListView.StrictlyEnforceRange

            delegate: Item {
                width: Style.resize(410)
                height: root.fullSize ? Style.resize(278) : Style.resize(300)

                ColumnLayout {
                    width: parent.width

                    RowLayout {
                        id: navigationLayout
                        Layout.fillWidth: true
                        Layout.preferredHeight: Style.resize(46)
                        Label {
                            font.pixelSize: Style.fontSizeL
                            text: Qt.locale().standaloneMonthName(index) + " " + monthGrid.year
                            color: root.fullSize ? Style.fontPrimaryColor : Style.mainColor
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }

                        ToolButton {
                            Layout.preferredWidth: Style.resize(27)
                            Layout.preferredHeight: Style.resize(27)
                            icon.color: undefined
                            icon.source: Style.icon("left")
                            opacity: (calendarList.currentIndex > 0) ? 1 : 0
                            Behavior on opacity { NumberAnimation {}}
                            onClicked: { calendarList.decrementCurrentIndex(); }
                        }

                        Button {
                            Layout.preferredWidth: Style.resize(80)
                            Layout.preferredHeight: Style.resize(30)
                            text: qsTr("Today")
                            onClicked: { root.resetCalendar(); }
                        }

                        ToolButton {
                            Layout.preferredWidth: Style.resize(27)
                            Layout.preferredHeight: Style.resize(27)
                            icon.color: undefined
                            icon.source: Style.icon("right")
                            onClicked: { calendarList.incrementCurrentIndex(); }
                        }
                    }

                    DayOfWeekRow {
                        Layout.fillWidth: true
                        Layout.preferredHeight: Style.resize(35)
                        spacing: Style.resize(6)
                        topPadding: Style.resize(6)
                        bottomPadding: Style.resize(6)
                        locale: Qt.locale()
                        delegate: Item {
                            width: parent.width
                            height: Style.resize(20)
                            Label {
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: Style.inactiveColor
                                text: model.shortName
                            }
                        }
                    }

                    MonthGrid {
                        id: monthGrid
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        spacing: Style.resize(6)
                        locale: Qt.locale()
                        month: index
                        delegate: Item {
                            width: Style.resize(40)
                            height: Style.resize(40)

                            Rectangle {
                                id: highlight
                                width: Style.resize(37)
                                height: Style.resize(37)
                                anchors.centerIn: parent
                                radius: (width/2)
                                color: Style.mainColor
                                visible: (!!root.selectedDate && (Qt.formatDate(root.selectedDate,"ddd MMM d yyyy")
                                         === Qt.formatDate(model.date,"ddd MMM d yyyy")))
                            }

                            Label {
                                id: dayNameLabel
                                anchors.centerIn: parent
                                text: model.day
                                color: highlight.visible ? Style.fontContrastColor : Style.fontSecondaryColor
                            }

                            Rectangle {
                                width: Style.resize(8)
                                height: Style.resize(8)
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: dayNameLabel.bottom
                                radius: (width/2)
                                property var delegateDate: (model.date.toString().substring(8,10) + model.date.toString().substring(4, 7)).replace(/\s/g,"")
                                visible: root.reminderData.includes(delegateDate)
                                color: visible ? root.reminderData[root.reminderData.indexOf(delegateDate)+1] : "transparent"
                            }
                        }
                        onClicked: function(date) {
                            root.selectedDate = date;
                        }
                    }
                }
            }
            Component.onCompleted: {
                root.resetCalendar();
            }
        }
    }
}
