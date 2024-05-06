import QtQuick
import QtCore

import utils

import inbox as Inbox
import calendar as Calendar
import courses as Courses
import latestnews as LatestNews
import webradio as WebRadio

Item {
    id: root
    state: "Dashboard"
    objectName: "Dashboard"

    property bool reorderDashboardItems: false

    signal openNewReminderPopup()
    signal openNewTaskPopup(var selectedDate)
    signal openReplyPopup(bool isReply, string sender, string subject)

    onWidthChanged: {
        if (root.reorderDashboardItems) {
            root.reorderDashboardItems = false;
        } else {
            inboxWidget.x = Style.resize(uiSettings.inboxWidgetX);
            inboxWidget.y = Style.resize(uiSettings.inboxWidgetY);
            coursesWidget.x = Style.resize(uiSettings.coursesWidgetX);
            coursesWidget.y = Style.resize(uiSettings.coursesWidgetY);
            calendarWidget.x = Style.resize(uiSettings.calendarWidgetX);
            calendarWidget.y = Style.resize(uiSettings.calendarWidgetY);
            latestNewsWidget.x = Style.resize(uiSettings.latestNewsWidgetX);
            latestNewsWidget.y = Style.resize(uiSettings.latestNewsWidgetY);
            webRadioWidget.x = Style.resize(uiSettings.webRadioWidgetX);
            webRadioWidget.y = Style.resize(uiSettings.webRadioWidgetY);
        }
    }

    Settings {
        id: uiSettings

        property int inboxWidgetX: 20
        property int inboxWidgetY: 20

        property int coursesWidgetX: 569
        property int coursesWidgetY: 20

        property int calendarWidgetX: 947
        property int calendarWidgetY: 20

        property int latestNewsWidgetX: 20
        property int latestNewsWidgetY: 495

        property int webRadioWidgetX: 967
        property int webRadioWidgetY: 495
    }

    Item {
        id: dragItemsArea
        anchors.fill: parent
        clip: true

        Item {
            id: inboxWidget
            width: Style.resize(529)
            height: Style.resize(455)
            onXChanged: { if (root.reorderDashboardItems) uiSettings.inboxWidgetX = x; }
            onYChanged: { if (root.reorderDashboardItems) uiSettings.inboxWidgetY = y; }
        }

        Item {
            id: coursesWidget
            width: Style.resize(378)
            height: Style.resize(455)
            onXChanged: { if (root.reorderDashboardItems) uiSettings.coursesWidgetX = x; }
            onYChanged: { if (root.reorderDashboardItems) uiSettings.coursesWidgetY = y; }
        }

        Item {
            id: calendarWidget
            width: Style.resize(529)
            height: Style.resize(455)
            onXChanged: { if (root.reorderDashboardItems) uiSettings.calendarWidgetX = x; }
            onYChanged: { if (root.reorderDashboardItems) uiSettings.calendarWidgetY = y; }
        }

        Item {
            id: latestNewsWidget
            width: Style.resize(927)
            height: Style.resize(455)
            onXChanged: { if (root.reorderDashboardItems) uiSettings.latestNewsWidgetX = x; }
            onYChanged: { if (root.reorderDashboardItems) uiSettings.latestNewsWidgetY = y; }
        }

        Item {
            id: webRadioWidget
            width: Style.resize(529)
            height: Style.resize(455)
            onXChanged: { if (root.reorderDashboardItems) uiSettings.webRadioWidgetX = x; }
            onYChanged: { if (root.reorderDashboardItems) uiSettings.webRadioWidgetY = y; }
        }
    }

    Inbox.Main {
        parent: (root.state === "Dashboard") ? inboxWidget : root
        opacity: (root.state === "Dashboard" || root.state === "Inbox") ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 250 } }
        visible: (opacity > 0.0)
        fullSize: (root.state === "Inbox")
        onOpenReplyPopup: function (isReply, sender, subject) {
            root.openReplyPopup(isReply, sender, subject);
        }
    }

    Calendar.Main {
        parent: (root.state === "Dashboard") ? calendarWidget : root
        opacity: (root.state === "Dashboard" || root.state === "Calendar") ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 250 } }
        visible: (opacity > 0.0)
        fullSize: (root.state === "Calendar")
        onOpenNewReminderPopup: function() {
            root.openNewReminderPopup();
        }
        onOpenNewTaskPopup: function(selectedDate) {
            root.openNewTaskPopup(selectedDate);
        }
    }

    Courses.Main {
        parent: (root.state === "Dashboard") ? coursesWidget : root
        opacity: (root.state === "Dashboard" || root.state === "Courses") ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 250 } }
        visible: (opacity > 0.0)
        fullSize: (root.state === "Courses")
        onOpenNewReminderPopup: function() {
            root.openNewReminderPopup();
        }
    }

    LatestNews.Main {
        parent: (root.state === "Dashboard") ? latestNewsWidget : root
        opacity: (root.state === "Dashboard" || root.state === "Latest News") ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 250 } }
        visible: (opacity > 0.0)
        fullSize: (root.state === "Latest News")
    }

    WebRadio.Main {
        parent: (root.state === "Dashboard") ? webRadioWidget : root
        opacity: (root.state === "Dashboard" || root.state === "Web Radio") ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 250 } }
        visible: (opacity > 0.0)
        fullSize: (root.state === "Web Radio")
    }

    MouseArea {
        anchors.fill: parent
        enabled: root.reorderDashboardItems
        drag.target: dragItemsArea.childAt(mouseX, mouseY)
    }
}
