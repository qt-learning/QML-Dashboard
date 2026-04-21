# Copyright (C) 2026 Qt Group and its licensors.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

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
