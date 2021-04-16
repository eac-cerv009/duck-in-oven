import QtQuick 2.0
import "components"

Item {

    objectName: "cookBookView"

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

            onClicked: {
                masterController.ui_ovenControlState.ovenTemperatureChoosen(model.temperature);
                masterController.ui_ovenControlState.ovenTimerChoosen( model.cookingTime);
                masterController.ui_controlFlow.goRunningView()
            }
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
        ListElement { recipe: "Duck"; temperature: "510"; cookingTime: "01:18" }
        ListElement { recipe: "Chicken"; temperature: "408"; cookingTime: "00:25" }
        ListElement { recipe: "Beef"; temperature: "464"; cookingTime: "00:47" }
        ListElement { recipe: "Fish"; temperature: "375"; cookingTime: "00:36" }
        ListElement { recipe: "Turkey"; temperature: "420"; cookingTime: "01:04" }
//        ListElement { recipe: "Demo X"; temperature: "360"; cookingTime: "00:10" }
//        ListElement { recipe: "Demo Y"; temperature: "390"; cookingTime: "01:20" }
//        ListElement { recipe: "Demo Z"; temperature: "420"; cookingTime: "02:30" }
    }
}



