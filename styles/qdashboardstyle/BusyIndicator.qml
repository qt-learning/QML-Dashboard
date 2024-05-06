import QtQuick
import QtQuick.Templates as T

import utils

T.BusyIndicator {
    id: root

    implicitWidth: Style.resize(40)
    implicitHeight: Style.resize(40)
    visible: (opacity > 0.0)
    running: visible

    contentItem: Item {
        id: contentItem
        anchors.fill: parent

        x: parent.width / 2 - Style.resize(32)
        y: parent.height / 2 - Style.resize(32)
        opacity: root.running ? 1 : 0

        Behavior on opacity {
            OpacityAnimator {
                duration: 250
            }
        }

        RotationAnimator {
            target: contentItem
            running: (root.visible && root.running)
            from: 0
            to: 360
            loops: Animation.Infinite
            duration: 1250
        }

        Repeater {
            id: repeater
            model: 6

            Rectangle {
                x: ((contentItem.width / 2) - (width / 2))
                y: ((contentItem.height / 2) - (height / 2))
                implicitWidth: Style.resize(10)
                implicitHeight: Style.resize(10)
                radius: Style.resize(5)
                color: Style.mainColor
                transform: [
                    Translate {
                        y: -((Math.min(contentItem.width, contentItem.height) * 0.5) + Style.resize(5))
                    },
                    Rotation {
                        angle: ((index / repeater.count) * 360)
                        origin.x: 5
                        origin.y: 5
                    }
                ]
            }
        }
    }
}
