import QtQuick 2.0
import Themes 1.0

Rectangle {
    id: bottomBar

    color: ColorTheme.bottomBarBackgroundColor

    IconButton {
        id: cameraButton

        width: 62; height: 62

        anchors {
            right: nextButton.left
            verticalCenter: nextButton.verticalCenter
            rightMargin: 40
        }
    }

    TextButton {
        id: nextButton

        width: 155
        height: 62

        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 40
        }

        radius: width / 4

        showBorder: false
        centerTextAligment: true
        textFontSize: TextStyle.bottonBarText_fontSize
        text: qsTr("NEXT")
    }
}
