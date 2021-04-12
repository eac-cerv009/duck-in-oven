import QtQuick 2.0
import QtQuick.Controls 2.2
import Themes
import "../components"

Rectangle {

    property var topBarHeightFactor: 0.18
    property var  bottomBarHeightFactor: 0.16

    color: ColorTheme.centerPanelBackgroundColor

    TopBar {
        id: topBar

        height: parent.height * topBarHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Connections {
        target: masterController.ui_controlFlow
        onGoCookbookView:
            contentFrame.replace("qrc:/views/CookBookView.qml");
        onGoManualBakeView:
            contentFrame.replace("qrc:/views/ManualBakeView.qml");
        onGoManualTemperatureView:
            contentFrame.replace("qrc:/views/ManualTemperatureTimerTabView.qml")
        onGoManualTimerView:
            contentFrame.replace("qrc:/views/ManualTemperatureTimerTabView.qml")
        onGoRunningView:
            contentFrame.replace("qrc:/views/RunningView.qml")
        onGoCameraPreview:
            contentFrame.replace("qrc:/views/CameraPreviewView.qml")

    }

    StackView {
        id: contentFrame

        anchors {
            top: topBar.bottom
            bottom: bottomBar.top
            left: parent.left
            right: parent.right
        }

        clip: true

        initialItem: "qrc:/views/DefaultView.qml"
    }

    BottomBar {
        id: bottomBar

        height: parent.height * bottomBarHeightFactor
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}


