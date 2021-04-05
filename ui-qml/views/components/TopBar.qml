import QtQuick 2.0

Rectangle {
    id: topBar

    color: "#424241"

    Text {
        id: statusText

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: 10
            //verticalCenter: parent.verticalCenter
        }

        verticalAlignment: Text.AlignVCenter
        text: qsTr("Status text")
        color: "white"
    }

    Text {
        id: timeTextTopBar

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            margins: 10
            //verticalCenter: parent.verticalCenter
        }

        verticalAlignment: Text.AlignVCenter
        text: qsTr("11:15 AM") // TODO time taken from a C++ Class
        color: "white"
    }
}
