import QtQuick 2.0
import "components"

Item {

    objectName: "settingsView"

    property int settingButtonWidth: 700
    property int settingButtonHeight: 90
    property int buttonsSpacing: 15

    Component {
        id: settingsDelegate

        TextButton {
            width: settingButtonWidth; height: settingButtonHeight
            radius: width / 8
            textLeftMargin: 20
            textBottomMargin: 10
            text: model.setting
        }
    }

    GridView {
        id: grid
        anchors {
            fill: parent
            margins: 30
        }

        cellWidth:  settingButtonWidth + buttonsSpacing
        cellHeight: settingButtonHeight + buttonsSpacing

        model: settingsModel
        delegate: settingsDelegate
        clip: true
    }

    ListModel {
        id: settingsModel
        ListElement { setting: "WiFi" }
        ListElement { setting: "Bluetooth " }
        ListElement { setting: "Unit Temperature " }
//        ListElement { recipe: "Demo X" }
//        ListElement { recipe: "Demo Y" }
//        ListElement { recipe: "Demo Z" }
    }
}



