import QtQuick

import utils
import views
import calendar

Row {
    id: root
    width: Style.resize(529)
    height: root.fullSize ? Style.resize(389) : parent.height
    anchors.top: parent.top
    anchors.topMargin: Style.resize(20)
    anchors.left: parent.left
    anchors.leftMargin: Style.resize(20)
    spacing: Style.resize(80)

    property bool fullSize
    property RootStore rootStore: RootStore { }
    signal openNewReminderPopup()
    signal openNewTaskPopup(var selectedDate)

    CalendarPanel {
        id: calendarComponent
        width: Style.resize(529)
        height: Style.resize(455)
        fullSize: root.fullSize
        reminderData: root.rootStore.reminderData
    }

    TasksListView {
        visible: root.fullSize
        rootStore: root.rootStore
        calendarSelectedDate: calendarComponent.selectedDate
        onOpenNewTaskPopup: function(selectedDate) {
            root.openNewTaskPopup(selectedDate);
        }
    }

    RemindersListView {
        width: Style.resize(378)
        height: Style.resize(455)
        anchors.margins: Style.resize(15)
        visible: root.fullSize
        rootStore: root.rootStore
        onOpenNewReminderPopup: function() {
            root.openNewReminderPopup();
        }
    }
}
