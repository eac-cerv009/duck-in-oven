import QtQuick 2.0

Item {

    property int buttonWidth: 60
    property int buttonHeight: 60
    property bool showBorder: true
    property bool centerTextAligment: false
    property int numberSpacing: 15
    property int rowsNumber: 2
    property int columnsNumber: 5

    Grid {
        id: numberPad

        rows: rowsNumber
        columns: columnsNumber
        spacing: numberSpacing

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Repeater {
            model: numbersModel
            delegate: numberPadComponent
        }
    }

    Component {
        id: numberPadComponent

        NumericalDigitButton {
            id: digitButton

            width: buttonWidth
            height: buttonHeight
            radius: buttonWidth / 2
            centerTextAligment: true

            text: model.digit
        }
    }

    ListModel {
        id: numbersModel
        ListElement { digit: "1" }
        ListElement { digit: "2" }
        ListElement { digit: "3" }
        ListElement { digit: "4" }
        ListElement { digit: "5" }
        ListElement { digit: "6" }
        ListElement { digit: "7" }
        ListElement { digit: "8" }
        ListElement { digit: "9" }
        ListElement { digit: "0" }
    }

}
