import QtQuick

import utils
import views
import courses

Item {
    id: root
    anchors.fill: parent

    property bool fullSize
    property RootStore rootStore: RootStore { }
    signal openNewReminderPopup()

    Flow {
        anchors.fill: parent
        anchors.margins: Style.resize(20)
        spacing: Style.resize(20)

        WeeklyActivityPanel {
            visible: root.fullSize
            doneData: root.rootStore.doneData
            urgentData: root.rootStore.urgentData
            inProgressData: root.rootStore.inProgressData
        }

        RemindersListView {
            rootStore: root.rootStore
            onOpenNewReminderPopup: {
                root.openNewReminderPopup();
            }
        }

        CourseProgressPanel {
            visible: root.fullSize
        }
    }
}
