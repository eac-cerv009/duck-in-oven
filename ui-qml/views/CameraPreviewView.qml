import QtQuick 2.0

Item {

    property int photoMargins: 15
    Image {
        id: photo

        anchors {
            margins: photoMargins
            top: parent.top
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        source: "/views/assets/images/picture.png"
    }
}
