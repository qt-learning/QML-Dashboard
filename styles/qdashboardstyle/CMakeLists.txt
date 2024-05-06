qt_add_library(qdashboardstyle STATIC)
qt_add_qml_module(qdashboardstyle
    URI "qdashboardstyle"
    VERSION 1.0
    QML_FILES
        BusyIndicator.qml
        Button.qml
        Dial.qml
        Label.qml
        Popup.qml
        RadioButton.qml
        Slider.qml
        Switch.qml
        ToolButton.qml
)
