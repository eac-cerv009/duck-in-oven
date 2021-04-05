import QtQuick 2.0
import QtQuick.Controls 2.0

/*Rectangle {
    id: button
//    x: 12; y:12
    width: 80 ; height: 80
//    color: "lightsteelblue"
//    border.color: "slategrey"
    Text {
        anchors.centerIn: parent
        text: "button"
    }

    Image {
        id: icon
        source: "/views/assets/images/picture.png"
        width: 40; height: 40
        anchors.centerIn: parent

    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            icon.source = "/views/assets/images/yay.png"
        }
        onPressed: {
            icon.source = "/views/assets/images/unicorn.png"
        }
    }
}*/

AbstractButton {
    id: button

    property alias iconSource: icon.source

    implicitWidth: 50
    implicitHeight: 100

    display: AbstractButton.IconOnly

    contentItem: Image {
        id: icon
        fillMode: Image.Pad
        source: "/views/assets/images/picture.png"
        sourceSize { width: 60; height: 60 } // ### TODO: resize the image
    }

//    x: 12; y:12
    width: 80 ; height: 80
//    Rectangle {
//        anchors.fill: parent
//        color: "lightsteelblue"
//        border.color: "slategrey"
//    }
    background:     Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        border.color: "red"
                    }

//    Text {
//        anchors.centerIn: parent
//        text: "button"
//    }
    text: "Aidali"

    icon.name: "oven"

    onPressed: {
        icon.source = "/views/assets/images/yay.png"
    }

    onClicked: {
        icon.source = "/views/assets/images/unicorn.png"
    }
}

