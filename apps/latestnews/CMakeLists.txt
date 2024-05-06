qt_add_library(latestnews STATIC)
qt_add_qml_module(latestnews
    URI "latestnews"
    VERSION 1.0
    QML_FILES
        Main.qml
        panels/CategoriesPanel.qml
        views/NewsItemsView.qml
        stores/RootStore.qml
)
