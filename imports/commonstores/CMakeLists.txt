set_source_files_properties(Store.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_add_library(commonstores STATIC)
qt_add_qml_module(commonstores
    URI "commonstores"
    VERSION 1.0
    QML_FILES
        Store.qml
)
