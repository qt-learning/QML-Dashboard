qt_add_library(inbox STATIC)
qt_add_qml_module(inbox
    URI "inbox"
    VERSION 1.0
    QML_FILES
        Main.qml
        views/InboxView.qml
        controls/InboxViewDelegate.qml
        stores/RootStore.qml
        stores/EmailsListModel.qml
)
