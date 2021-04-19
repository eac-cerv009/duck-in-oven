import QtQuick 2.0
import Themes 1.0

Rectangle {
    id: bottomBar

    property alias cameraButton: cameraButton
    property alias actionButton: actionButton

    color: ColorTheme.bottomBarBackgroundColor

    IconButton {
        id: cameraButton

        width: 62; height: 62

        anchors {
            right: actionButton.left
            verticalCenter: actionButton.verticalCenter
            rightMargin: 40
        }

        visible: false

        showBorder: true
        showBackground: true

        icon.name: "camera"
        icon.width: 40
        icon.height: 40

        onClicked: cameraButton.checked ? masterController.ui_controlFlow.goCameraPreview() :
                                          masterController.ui_controlFlow.goRunningView()
    }

    TextButton {
        id: actionButton

        width: 155
        height: 62

        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 40
        }
 
        visible: false

        radius: width / 4

        showBorder: false
        centerTextAligment: true
        textFontSize: TextStyle.bottonBarText_fontSize
        text: qsTr("NEXT")

        onClicked: masterController.ui_controlFlow.actionButtonBottomBarClicked()
    }
}
