import QtQuick

QtObject {
    id: root

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
}
