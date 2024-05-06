qt_add_library(courses STATIC)
qt_add_qml_module(courses
    URI "courses"
    VERSION 1.0
    QML_FILES
        Main.qml
        controls/HintCard.qml
        controls/CircularBar.qml
        panels/CourseProgressPanel.qml
        panels/WeeklyActivityPanel.qml
        stores/RootStore.qml
)
