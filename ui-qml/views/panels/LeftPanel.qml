import QtQuick 2.0
import "../components"
//import QtQuick.Controls 2.0

//Item {
Rectangle {
    id: leftPanel

    width: 442; height: parent.height
    color: "#51504F"

// ### SoB To Debug UI
//    Rectangle {
//        color: "yellow"
//        opacity: 0.3
    Column {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 150

        Button {
            id: ovenButton
            anchors.horizontalCenter: parent.horizontalCenter
            iconSource: "/views/assets/images/oven.png"
        }

        Button {
            id: cookbookButton
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: moreButton
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    /*Column {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 80

        Button {
            id: ovenButton
            width: 60 ; height: 60
            flat: true
            icon.name: "oven"
            icon.color: "white"
            onPressed: icon.color = "orange"
            onClicked: icon.color = "green"
        }
        Button {
            id: cookbookButton
            width: 60 ; height: 60
            flat: true
            checkable: true
            icon.name: "cookbook"
            icon.color: "white"
            onPressed: icon.color = "orange"
            onClicked: icon.color = "green"
        }
        Button {
            id: moreButton
            width: 60 ; height: 60
            flat: true
            icon.name: "more"
            icon.color: "white"
            onPressed: {
                icon.color = "orange"
//                background: Rectangle {
//                    anchors.fill: parent
//                    color: "transparent"
//                    border.color: "red"
//                }
            }
            onClicked: icon.color = "green"
        }
    }*/

}
