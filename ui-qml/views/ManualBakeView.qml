import QtQuick 2.0
import "components"

Item {

    property int bakeButtonWidth: 233
    property int bakeButtonHeight: 207
    property int buttonsSpacing: 15

    Component {
        id: bakeDelegate

        TextButton {
            id: bakeButton

            width: bakeButtonWidth; height: bakeButtonHeight

            radius: width / 8
            textLeftMargin: 20
            textBottomMargin: 10

            text: model.bakeOption
        }
    }

    GridView {
        id: grid
        anchors {
            fill: parent
            margins: 30
        }
        cellWidth:  bakeButtonWidth + buttonsSpacing
        cellHeight: bakeButtonHeight + buttonsSpacing

        model: bakeModel
        delegate: bakeDelegate
        clip: true
    }


    ListModel {
        id: bakeModel
        ListElement { bakeOption: "Text" }
        ListElement { bakeOption: "Text B" }
        ListElement { bakeOption: "Text C" }
        ListElement { bakeOption: "Text D" }
        ListElement { bakeOption: "Text E" }
    }
}



