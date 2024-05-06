qt_add_library(webradio STATIC)
qt_add_qml_module(webradio
    URI "webradio"
    VERSION 1.0
    QML_FILES
        Main.qml
        views/RadioView.qml
        views/RadioStationsView.qml
        panels/Object3DPanel.qml
        panels/RadioControlsPanel.qml
        controls/RadioStationLogo.qml
        controls/RadioStationDelegate.qml
        stores/RootStore.qml
        stores/WebRadioStationsModel.qml
)
