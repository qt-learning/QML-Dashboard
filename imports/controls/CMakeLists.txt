qt_add_library(controls STATIC)
qt_add_qml_module(controls
    URI "controls"
    VERSION 1.0
    QML_FILES
        BaseCard.qml
        Separator.qml
)
