import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

import utils

Item {
    id: root
    width: parent.width
    height: Style.resize(239)

    property string icon
    property string name
    property string address
    property string status

    Image {
        width: Style.resize(sourceSize.width)
        height: Style.resize(sourceSize.height)
        source: root.icon
        anchors.top: parent.top
        anchors.topMargin: -Style.resize(1)
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Image {
        id: userImage
        width: Style.resize(sourceSize.width)
        height: Style.resize(sourceSize.height)
        visible: !!root.icon
        source: Style.gfx("outercircle")
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Column {
        width: Style.resize(200)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: userImage.bottom
        anchors.topMargin: Style.resize(20)
        spacing: Style.resize(10)
        Row {
            spacing: Style.resize(10)
            height: Style.resize(24)
            visible: !!root.name
            Item {
                width: Style.resize(24)
                height: Style.resize(24)
                Image {
                    width: Style.resize(sourceSize.width)
                    height: Style.resize(sourceSize.height)
                    anchors.centerIn: parent
                    source: Style.icon("username")
                    layer.enabled: true
                    layer.effect: ColorOverlay {
                        color: Style.mainColor
                    }
                }
            }
            Label {
                id: name
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                text: root.name
                color: Style.mainColor
            }
        }
        Row {
            spacing: Style.resize(10)
            visible: !!root.address
            Item {
                width: Style.resize(24)
                height: Style.resize(24)
                Image {
                    width: Style.resize(sourceSize.width)
                    height: Style.resize(sourceSize.height)
                    anchors.centerIn: parent
                    source: Style.icon("location")
                    layer.enabled: true
                    layer.effect: ColorOverlay {
                        color: Style.mainColor
                    }
                }
            }

            Label {
                id: address
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                text: root.address
                color: Style.mainColor
                opacity: 0.8
            }
        }
        Row {
            spacing: Style.resize(10)
            visible: !!root.status
            Item {
                width: Style.resize(24)
                height: Style.resize(24)
                Image {
                    width: Style.resize(sourceSize.width)
                    height: Style.resize(sourceSize.height)
                    anchors.centerIn: parent
                    source: Style.icon("status")
                    layer.enabled: true
                    layer.effect: ColorOverlay {
                        color: Style.mainColor
                    }
                }
            }

            Label {
                id: status
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                text: root.status
                color: Style.mainColor
            }
        }
    }
}
