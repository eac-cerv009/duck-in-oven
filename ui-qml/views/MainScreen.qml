import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import Themes 1.0

import "panels"

Window {
    id: root
    visible: true

    width: 1920
    height: 548

    title: qsTr("Duck In Oven - ICS")

    color: ColorTheme.mainAreaBackgroundColor

    Connections {
        target: masterController.ui_ovenControlState

        function onOvenPowerStateChanged() {
            group.checkState = Qt.Unchecked
            rightPanel.lightButton.checked = false
        }
    }

    Connections {
        target: masterController.ui_controlFlow
        function onGoRunningView() {
            rightPanel.timeRunningButton.checked = true
        }
    }

    ButtonGroup {
        id: group
        buttons: [leftPanel.ovenButton, leftPanel.cookbookButton, leftPanel.moreButton,
            rightPanel.timeRunningButton, rightPanel.settingsButton]
    }

    LeftPanel {
        id: leftPanel

        width: 442
        height: parent.height
        anchors.left: parent.left
    }

    CenterPanel {
        id: centralPanel

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: leftPanel.right
            right: rightPanel.left
        }
    }

    RightPanel {
        id: rightPanel

        width: 442
        height: parent.height
        anchors.right: parent.right
    }
}
