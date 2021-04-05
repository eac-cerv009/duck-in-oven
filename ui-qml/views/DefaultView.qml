import QtQuick 2.0

Rectangle {
    id: defaultView

    color: "#2F2F2F"

    Text {
        id: timeText
        anchors.horizontalCenter: parent.horizontalCenter

        text: qsTr("11:15 AM") // Data from C++
        color: "white"
    }

    Text {
        id: dateText
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: timeText.bottom
        text: qsTr("Monday, June 18") // Data from C++
        color: "white"
    }

}
