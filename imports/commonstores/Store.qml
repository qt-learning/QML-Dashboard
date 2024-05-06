pragma Singleton
import QtQuick

QtObject {
    id: root

    //new tasks popup
    signal addNewTask(bool even, string time, string title);

    //reminders popup
    property var reminderData: []

    property ListModel remindersModel: ListModel {
        id: remindersModel
        ListElement { date: "08"; month: "Jan"; description: "UX Principles paper"; color: "#00D1A8" }
        ListElement { date: "12"; month: "Jan"; description: "Borrow design book"; color: "#FFE361" }
        ListElement { date: "19"; month: "May"; description: "Prepare for oral exam"; color: "#00D1A8" }
        ListElement { date: "24"; month: "May"; description: "Math exam"; color: "#FF5900" }
        Component.onCompleted: {
            for (var i = 0; i < count; i++) {
                root.reminderData.push((get(i).date+get(i).month), get(i).color);
            }
        }
    }

    function addNewReminder(day, month, description, color) {
        remindersModel.append({"date": day, "month": month, "description": description, "color": color});
        root.reminderData.push((remindersModel.get(remindersModel.count-1).date+
                                remindersModel.get(remindersModel.count-1).month),
                                remindersModel.get(remindersModel.count-1).color);
    }
}
