import QtQuick

import commonstores

QtObject {
    id: root

    property var reminderData: Store.reminderData
    property var remindersModel: Store.remindersModel
    property var commonStoreCnx: Connections {
        target: Store
        function onAddNewTask(even, time, title) {
            if (even) {
                root.tasksModelEven.insert(root.tasksModelEven.count, {"time": time, "text": title});
            } else {
                root.tasksModelOdd.insert(root.tasksModelOdd.count, {"time": time, "text": title});
            }
        }
    }

    property ListModel tasksModelEven: ListModel {
        id: tasksModelEven
        ListElement { time: "08:00-10:00"; text: "Math" }
        ListElement { time: "10:00-12:00"; text: "Material Design" }
        ListElement { time: "13:00-15:30"; text: "Design" }
        ListElement { time: "16:00-17:00"; text: "Programming" }
        ListElement { time: "17:00-19:00"; text: "English" }
    }

    property ListModel tasksModelOdd: ListModel {
        id: tasksModelOdd
        ListElement { time: "09:00-12:00"; text: "Audiovisual" }
        ListElement { time: "13:00-15:00"; text: "Product Photography" }
        ListElement { time: "15:30-17:00"; text: "Physics" }
        ListElement { time: "17:00-19:00"; text: "Programming Principles" }
        ListElement { time: "19:00-21:00"; text: "Design Principles" }
    }

    function filterTasksModel(date) {
        var model = [];
        var tasksModel = date% 2 == 0 ? tasksModelEven : tasksModelOdd;
        for (var i = 0; i < tasksModel.count; i++) {
            model.push(tasksModel.get(i));
        }
        return model;
    }

    function removeTask(date, index) {
        if (date% 2 == 0) {
            root.tasksModelEven.remove(index, 1);
        } else {
            root.tasksModelOdd.remove(index, 1);
        }
    }
}
