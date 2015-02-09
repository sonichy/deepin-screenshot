import QtQuick 2.1
import QtGraphicalEffects 1.0
Item {
    id: savetooltip
    width: text.implicitWidth + 20
    height: 28
    clip: true
    visible: false

    property string text:"Autosave"

    Behavior on width {
        NumberAnimation {
            duration: 100
            easing.type: Easing.OutSine
        }
    }

    Image {
        id: tipbackground
        anchors.fill: parent
        source: "../image/save/imgo.jpg"
        visible: false
    }
    InnerShadow {
        id:innerShadow
        anchors.fill: tipbackground
        radius: 10
        samples: 16
        color: Qt.rgba(0, 0, 0, 0.5)
        horizontalOffset: -1
        verticalOffset: -1
        source: tipbackground
        visible: false
    }

    Item {
        id: tooltipItem
        anchors.fill: parent
        clip: true
        visible: false

        Canvas {
            id: tooltipCanvas
            width: parent.width
            height: parent.height

            onPaint: {
                var ctx = getContext("2d")
                ctx.strokeStyle = "white"
                ctx.beginPath()
                ctx.moveTo(0, 4)
                ctx.arcTo(0, 0, 4, 0, 4)
                ctx.lineTo(width, 0)
                ctx.lineTo(width, height)
                ctx.lineTo(0, height)
                ctx.lineTo(0, 4)
                ctx.closePath()
                ctx.fillStyle = "white"
                ctx.fill()
            }
        }
    }

    OpacityMask {

        source: innerShadow
        maskSource: tooltipItem
        anchors.fill: tooltipItem
        anchors.leftMargin: 1
        anchors.topMargin: 1
    }

    Text {
        id: text
        text: savetooltip.text
        color: "#FDA825"
        font.pixelSize: 12

        anchors.centerIn: parent
    }
}
