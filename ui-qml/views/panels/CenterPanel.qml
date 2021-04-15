import QtQuick 2.0
import QtQuick.Controls 2.2
import Themes
import "../components"

Rectangle {

    property var topBarHeightFactor: 0.18
    property var  bottomBarHeightFactor: 0.16
    property int indexControl : 0

    color: ColorTheme.centerPanelBackgroundColor

    Connections {
        target: masterController.ui_controlFlow
        function onGoOvenManualSet() {
            if (contentFrame.currentItem.objectName != "manualTemperatureTimerView") {
                contentFrame.replace("qrc:/views/ManualTemperatureTimerTabView.qml");
                bottomBar.actionButton.visible = true
            }
        }
        function onGoCookbookView() {
            if (contentFrame.currentItem.objectName != "cookBookView") {
                contentFrame.replace("qrc:/views/CookBookView.qml");
                bottomBar.actionButton.visible = true
            }
        }
        function onGoManualBakeView() {
            if (contentFrame.currentItem.objectName != "manualBakeView")
                contentFrame.replace("qrc:/views/ManualBakeView.qml");
        }
        function onGoManualTemperatureView() {
            if (contentFrame.currentItem.objectName != "View")
                contentFrame.replace("qrc:/views/ManualTemperatureTimerTabView.qml")
        }
        function onGoManualTimerView() {
            if (contentFrame.currentItem.objectName != "View")
                contentFrame.replace("qrc:/views/ManualTemperatureTimerTabView.qml")
        }
        function onGoRunningView() {
            if (contentFrame.currentItem.objectName != "runningView") {
                contentFrame.replace("qrc:/views/RunningView.qml")
                bottomBar.actionButton.text = masterController.ui_ovenControlState.ui_ovenRunning ? qsTr("Cancel") : qsTr("Start")
                bottomBar.actionButton.visible = true
            }
        }
        function onGoCameraPreview() {
            if (contentFrame.currentItem.objectName != "cameraPreviewView")
                contentFrame.replace("qrc:/views/CameraPreviewView.qml")
        }
        function onGoSettingsView() {
            if (contentFrame.currentItem.objectName != "settingsView")
                contentFrame.replace("qrc:/views/SettingsView.qml")
        }
    }

    Connections {
        target: masterController.ui_ovenControlState

        function onOvenRunningStateChanged() {
            bottomBar.actionButton.text = masterController.ui_ovenControlState.ui_ovenRunning ? qsTr("Cancel") : qsTr("Start")
        }
    }

    TopBar {
        id: topBar

        height: parent.height * topBarHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
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


