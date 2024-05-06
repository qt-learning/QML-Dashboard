qt_add_library(views STATIC)
qt_add_qml_module(views
    URI "views"
    VERSION 1.0
    QML_FILES
        RemindersListView.qml
)
