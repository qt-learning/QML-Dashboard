// Copyright (C) 2026 Qt Group and its licensors.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

QtObject {

    property var emailsModel: !!emailsModel ? emailsModel : []

    property EmailsListModel emailsModels: EmailsListModel {
        id: emailsModel
    }
}
