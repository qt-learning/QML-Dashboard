import QtQuick
import QtQuick.Controls

import utils

Canvas {
    id: root
    width: Style.resize(150)
    height: Style.resize(150)

    antialiasing: true

    property string text: ""
    property color mainColor: "#E6E6E6"
    property color fillColor: "transparent"
    property int lineWidth: Style.resize(10)
    property real value: 0.0

    NumberAnimation on value {
        from: 0.0; to: root.value
        duration: 2000
        running: root.visible
    }

    Label {
        anchors.centerIn: parent
        text: root.text
    }

    onValueChanged: { requestPaint(); }

    onPaint: {
        var ctx = getContext("2d");

        var centerX = width/2;
        var centerY = height/2;
        var radius = Math.min(width,height) / 2 - 10;

        //background circle
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
        ctx.strokeStyle = root.mainColor;
        ctx.lineWidth = root.lineWidth;
        ctx.stroke();

        //progress arc
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, -Math.PI / 2, -Math.PI / 2 + 2 * Math.PI * root.value);
        ctx.strokeStyle = root.fillColor;
        ctx.lineWidth = root.lineWidth;
        ctx.stroke();
    }
}
