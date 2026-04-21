# Copyright (C) 2026 Qt Group and its licensors.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

qt_add_library(views STATIC)
qt_add_qml_module(views
    URI "views"
    VERSION 1.0
    QML_FILES
        RemindersListView.qml
)
