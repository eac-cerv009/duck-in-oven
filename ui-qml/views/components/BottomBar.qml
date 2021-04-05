import QtQuick 2.0

Rectangle {
    id: bottomBar

    color: "#393939"

    Rectangle {
        id: cameraButton
        width: 30
        height: 30

        anchors {
            right: nextButton.left
            verticalCenter: parent.verticalCenter
            margins: 5
        }

        radius: 15
        color: "blue"
        border.color: "green"
    }

    Rectangle {
        id: nextButton
        width: 70//155
        height: 25 //62
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: 5
        }
        color: "#51504F"
        radius: 10

        Text {
            id: nextTextButton
            anchors.fill: parent
            text: qsTr("Next")
            color: "white"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
