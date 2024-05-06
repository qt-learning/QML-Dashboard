set_source_files_properties(Style.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_add_library(utils STATIC)
qt_add_qml_module(utils
    URI "utils"
    VERSION 1.0
    QML_FILES
        Style.qml
        Tracer.qml
)
