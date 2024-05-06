import QtQuick

import utils
import commonstores

QtObject {
    id: root

    property var remindersModel: Store.remindersModel

    property var doneData: [Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100]
    property var inProgressData: [Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100]
    property var urgentData: [Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100, Math.random()*100]
}
