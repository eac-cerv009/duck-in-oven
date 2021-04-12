import QtQuick 2.0
import "components"

Item {
    property int recipeButtonWidth: 233
    property int recipeButtonHeight: 90
    property int buttonsSpacing: 15

    Component {
        id: recipeDelegate

        TextButton {
            width: recipeButtonWidth; height: recipeButtonHeight
            radius: width / 8
            textLeftMargin: 20
            textBottomMargin: 10
            text: model.recipe
        }
    }

    GridView {
        id: grid
        anchors {
            fill: parent
            margins: 30
        }

        cellWidth:  recipeButtonWidth + buttonsSpacing
        cellHeight: recipeButtonHeight + buttonsSpacing

        model: cookbookModel
        delegate: recipeDelegate
        clip: true
    }

    ListModel {
        id: cookbookModel
        ListElement { recipe: "Duck" }
        ListElement { recipe: "Chicken" }
        ListElement { recipe: "Beef" }
        ListElement { recipe: "Fish" }
        ListElement { recipe: "Turkey" }
        ListElement { recipe: "Demo X" }
        ListElement { recipe: "Demo Y" }
        ListElement { recipe: "Demo Z" }
    }



}



