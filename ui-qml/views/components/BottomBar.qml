import QtQuick 2.0
import Themes 1.0

Rectangle {
    id: bottomBar

    color: ColorTheme.bottomBarBackgroundColor

    Connections {
        target: masterController.ui_controlFlow
        onGoOvenManualSet:
            actionButton.visible= true
        onGoCookbookView:
            actionButton.visible= false
        onGoManualBakeView:
            actionButton.visible= false

    }

    IconButton {
        id: cameraButton

        width: 62; height: 62

        anchors {
            right: actionButton.left
            verticalCenter: actionButton.verticalCenter
            rightMargin: 40
        }
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
    }
}
