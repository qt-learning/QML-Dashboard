qt_add_library(popups STATIC)
qt_add_qml_module(popups
    URI "popups"
    VERSION 1.0
    QML_FILES
        NewOrReplyEmailPopup.qml
        NewReminderPopup.qml
        NewTaskPopup.qml
        Popups.qml
)
