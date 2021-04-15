import QtQuick 2.0
import Themes 1.0
import "../components"

import QtQuick.Controls 2.0

Rectangle {
    id: rightPanel

    property alias lightButton: lightButton
    property alias timeRunningButton: timeRunningButton
    property alias settingsButton: settingsButton

    implicitWidth: 442; implicitHeight: 548

    color: ColorTheme.sidePanelBackgroundColor

    Column {
        id: buttonsColumn

        width: (parent.width / 3)

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        IconButton {
            id: lightButton

            width: parent.width
            height: parent.height / 3

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn

            icon.name: "light"
            icon.width: 60
            icon.height: 60

            onClicked: masterController.ui_ovenControlState.lightButtonStateChanged(lightButton.checked)
        }

        IconButton {
            id: timeRunningButton

            width: parent.width
            height: parent.height / 3

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn

            icon.name: "timer"
            icon.width: 60
            icon.height: 60

            onClicked: masterController.ui_controlFlow.goRunningView()
        }

        IconButton {
            id: settingsButton

            width: parent.width
            height: parent.height / 3

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn

            icon.name: "settings"
            icon.width: 60
            icon.height: 60

            onClicked:  masterController.ui_controlFlow.goSettingsView()
        }
    }

    Column {
        id: connectivityButtonsColumn

        width: parent.width / 3
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        IconButton {
            id: bluetoothButton

            width: parent.width
            height: parent.height / 3

            icon.name: "bluetooth"
            icon.width: 60
            icon.height: 60

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn  && masterController.ui_bluetooth.ui_bluetoothAvailable
        }

        IconButton {
            id: wifiButton

            width: parent.width
            height: parent.height / 3

            icon.name: "wifi"
            icon.width: 60
            icon.height: 60

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn  && masterController.ui_wiFi.ui_wiFiAvailable
        }
    }
}
