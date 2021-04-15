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
                topBar.statusText.text = qsTr("Manual Set")
                contentFrame.replace("qrc:/views/ManualTemperatureTimerTabView.qml");
                bottomBar.actionButton.text = qsTr("Next")
                bottomBar.actionButton.visible = true
            }
        }
        function onGoCookbookView() {
            if (contentFrame.currentItem.objectName != "cookBookView") {
                topBar.statusText.text = qsTr("Cookbook")
                contentFrame.replace("qrc:/views/CookBookView.qml");
                bottomBar.actionButton.visible = false
            }
        }
        function onGoManualBakeView() {
            if (contentFrame.currentItem.objectName != "manualBakeView") {
                topBar.statusText.text = qsTr("")
                contentFrame.replace("qrc:/views/ManualBakeView.qml");
                bottomBar.actionButton.visible = false
            }
        }
        function onGoRunningView() {
            if (contentFrame.currentItem.objectName != "runningView") {
                topBar.statusText.text = qsTr("Timer status")
                contentFrame.replace("qrc:/views/RunningView.qml")
                bottomBar.actionButton.text = masterController.ui_ovenControlState.ui_ovenRunning ? qsTr("Cancel") : qsTr("Start")
                bottomBar.actionButton.visible = true
            }
        }
        function onGoCameraPreview() {
            if (contentFrame.currentItem.objectName != "cameraPreviewView") {
                topBar.statusText.text = qsTr("Camera Preview")
                contentFrame.replace("qrc:/views/CameraPreviewView.qml")
                bottomBar.actionButton.text = qsTr("Cancel")
                bottomBar.actionButton.visible = true
            }
        }
        function onGoSettingsView() {
            if (contentFrame.currentItem.objectName != "settingsView") {
                topBar.statusText.text = qsTr("Settings")
                contentFrame.replace("qrc:/views/SettingsView.qml")
                bottomBar.actionButton.visible = false
            }
        }
    }

    Connections {
        target: masterController.ui_ovenControlState

        function onOvenRunningStateChanged() {
            bottomBar.actionButton.text = masterController.ui_ovenControlState.ui_ovenRunning ? qsTr("Cancel") : qsTr("Start")
        }

        function onOvenPowerStateChanged() {
            if (contentFrame.currentItem.objectName != "defaultView") {
                contentFrame.replace("qrc:/views/DefaultView.qml")
            }
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


