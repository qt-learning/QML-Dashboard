import QtQuick
import QtQuick.Controls
// import QtGraphs
// import QtCharts

import controls
import utils
import courses

Frame {
    id: root
    width: Style.resize(1104)
    height: Style.resize(455)

    property var doneData: []
    property var urgentData: []
    property var inProgressData: []
    component Bar: Rectangle {
        width: Style.resize(10)
        radius: Style.resize(20)
    }

    background: BaseCard { }

    contentItem: Item {
        anchors.fill: parent
        anchors.leftMargin: Style.resize(40)
        anchors.rightMargin: Style.resize(40)

        Label {
            id: titleText
            anchors.top: parent.top
            anchors.topMargin: Style.resize(20)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(40)
            text: qsTr("Weekly Activity")
            font.pixelSize: Style.fontSizeL
        }

        Image {
            id: graph
            width: Style.resize(sourceSize.width)
            height: Style.resize(sourceSize.height)
            anchors.left: parent.left
            anchors.leftMargin: Style.resize(10)
            anchors.verticalCenter: parent.verticalCenter
            source: Style.gfx("graph")
        }

        //QtGraphs Graph
        // GraphsView {
        //     width: Style.resize(900)
        //     height: Style.resize(265)
        //     anchors.verticalCenter: parent.verticalCenter
        //     anchors.verticalCenterOffset: Style.resize(15)
        //     marginBottom: 0
        //     marginTop: 0
        //     marginLeft: -Style.resize(15)
        //     marginRight: 0
        //     antialiasing: true
        //     theme: GraphTheme {
        //         gridMajorBarsColor: "transparent"
        //         gridMinorBarsColor: "transparent"
        //         axisYMajorColor: "transparent"
        //         axisYMinorColor: "transparent"
        //         axisXMajorColor: "transparent"
        //         axisXMinorColor: "transparent"
        //     }
        //     BarSeries {
        //         axisX: BarCategoryAxis {
        //             visible: false
        //             categories: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        //         }
        //         axisY: ValueAxis {
        //             visible: false
        //             min: 0
        //             max: 100
        //         }
        //         BarSet { color: "#00D1A8"; values: root.doneData }
        //         BarSet { color: "#FFE361"; values: root.inProgressData }
        //         BarSet { color: "#FF5900"; values: root.urgentData }
        //     }
        // }

        //QtCharts Graph
        // ChartView {
        //     width: Style.resize(900)
        //     height: Style.resize(265)
        //     anchors.verticalCenter: parent.verticalCenter
        //     margins {
        //         left: Style.resize(10)
        //         right: 0
        //         top: 0
        //         bottom: Style.resize(10)
        //     }
        //     antialiasing: true
        //     legend.visible: false
        //     backgroundColor: "transparent"
        //     plotAreaColor: "transparent"
        //     BarSeries {
        //         axisX: BarCategoryAxis {
        //             visible: false
        //             categories: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        //         }
        //         axisY: ValueAxis {
        //             visible: false
        //             min: 0
        //             max: 100
        //         }
        //         BarSet { color: "#00D1A8"; values: root.doneData }
        //         BarSet { color: "#FFE361"; values: root.inProgressData }
        //         BarSet { color: "#FF5900"; values: root.urgentData }
        //     }
        // }

        //QML Graph
        Row {
            width: Style.resize(900)
            height: Style.resize(265)
            anchors.centerIn: parent
            spacing: Style.resize(70)
            Repeater {
                anchors.fill: parent
                model: 7
                delegate: Item {
                    width: Style.resize(50)
                    height: parent.height
                    Row {
                        anchors.fill: parent
                        anchors.bottomMargin: Style.resize(25)
                        spacing: Style.resize(10)
                        rotation: 180
                        Bar {
                            height: Style.resize(((root.urgentData[index])*parent.height)/100)
                            color: "#FF5900"
                        }
                        Bar {
                            height: Style.resize(((root.inProgressData[index])*parent.height)/100)
                            color: "#FFE361"
                        }
                        Bar {
                            height: Style.resize(((root.doneData[index])*parent.height)/100)
                            color: "#00D1A8"
                        }
                    }
                }
            }
        }

        HintCard {
            anchors.top: parent.top
            anchors.topMargin: Style.resize(60)
            anchors.left: graph.right
            anchors.leftMargin: Style.resize(40)
            greenIndText: qsTr("Done")
            yellowIndText: qsTr("In Progress")
            redIndText: qsTr("Urgent")
        }
    }
}
