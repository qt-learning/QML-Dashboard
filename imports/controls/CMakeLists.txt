# Copyright (C) 2026 Qt Group and its licensors.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

qt_add_library(controls STATIC)
qt_add_qml_module(controls
    URI "controls"
    VERSION 1.0
    QML_FILES
        BaseCard.qml
        Separator.qml
)
