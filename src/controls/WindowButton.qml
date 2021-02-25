import QtQuick 2.15
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import MeuiKit 1.0 as Meui

Item {
    id: control

    property var size: 32
    height: size
    width: size

    property color backgroundColor: Meui.Theme.darkMode ? Qt.lighter(Meui.Theme.backgroundColor, 1.5)
                                                   : Qt.darker(Meui.Theme.backgroundColor, 1.3)
    property alias source: image.source
    signal clicked()

    Rectangle {
        id: background
        anchors.fill: parent
        anchors.margins: size * 0.1
        radius: control.height / 2
        color: Meui.Theme.textColor
        opacity: mouseArea.pressed ? 0.3 : mouseArea.containsMouse ? 0.1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 125
                easing.type: Easing.InOutCubic
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onClicked: control.clicked()
    }

    Image {
        id: image
        objectName: "image"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        sourceSize: Qt.size(width, height)
        cache: true
        asynchronous: false
    }
}