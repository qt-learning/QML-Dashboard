import QtQuick

QtObject {

    property var emailsModel: !!emailsModel ? emailsModel : []

    property EmailsListModel emailsModels: EmailsListModel {
        id: emailsModel
    }
}
