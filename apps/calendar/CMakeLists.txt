qt_add_library(calendar STATIC)
qt_add_qml_module(calendar
    URI "calendar"
    VERSION 1.0
    QML_FILES
        Main.qml
        views/TasksListView.qml
        panels/CalendarPanel.qml
        stores/RootStore.qml
)
