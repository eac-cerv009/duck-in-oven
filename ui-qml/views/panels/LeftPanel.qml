import QtQuick 2.0
import Themes 1.0
import QtQuick.Controls 2.0
import "../components"

Rectangle {
    id: leftPanel

    property alias ovenButton: ovenButton
    property alias cookbookButton: cookbookButton
    property alias moreButton: moreButton

    implicitWidth: 442; implicitHeight: 548

    color: ColorTheme.sidePanelBackgroundColor

    Item {
        id: switchArea

        width: (parent.width / 3) * 2
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        IconButton {
            id: powerButton

            width: 131; height: 131
            anchors.centerIn: parent

            showBorder: true
            showBackground: true

            icon.name: "power"
            icon.width: 75
            icon.height: 75

            onClicked: masterController.ui_ovenControlState.powerButtonStateChanged(powerButton.checked)
        }
    }

    Column {
        id: buttonsColumn

        width: parent.width / 3

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: switchArea.right
            right: parent.right
        }

        IconButton {
            id: ovenButton

            width: parent.width
            height: parent.height / 3

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn

            icon.name: "oven"
            icon.width: 60
            icon.height: 60

            onClicked: masterController.ui_controlFlow.goOvenManualSet()
        }

        IconButton {
            id: cookbookButton

            width: parent.width
            height: parent.height / 3

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn

            icon.name: "cookbook"
            icon.width: 60
            icon.height: 60

            onClicked: masterController.ui_controlFlow.goCookbookView()
        }

        IconButton {
            id: moreButton

            width: parent.width
            height: parent.height / 3

            enabled: masterController.ui_ovenControlState.ui_ovenTurnedOn

            icon.name: "more"
            icon.width: 60
            icon.height: 60

            onClicked:  masterController.ui_controlFlow.goManualBakeView()
        }
    }

}
