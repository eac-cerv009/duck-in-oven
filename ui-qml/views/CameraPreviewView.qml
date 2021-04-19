import QtQuick 2.0

Item {

    objectName: "cameraPreviewView"

    Rectangle {
        id: insideOvenView

        anchors.fill: parent
        color: "black"
        opacity: masterController.ui_ovenControlState.ui_lightTurnedOn ? 0.3 : 0.7
        z: 1
    }

    property int photoMargins: 15
    Image {
        id: photo

        anchors {
            margins: photoMargins
            top: parent.top
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }

        fillMode: Image.PreserveAspectFit
        source: "/images/previewImage.png"
    }
}
