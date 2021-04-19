import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0


Item {
    id: timerSelector

    property string selectedTime: digitFour+digitThree+ ":" + digitTwo+digitOne
    property int counter: 0
    property string digitOne: "M"
    property string digitTwo: "M"
    property string digitThree: "H"
    property string digitFour: "H"

    Row {
        id: timerLabels

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: timerText

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.timer_fontSize
                weight: TextStyle.timer_fontWeight
            }
            color: TextStyle.timer_color

            text: qsTr(selectedTime)
        }
    }

    NumberPad {
        id: numberPad

        width: parent.width / 2
        anchors {
            top: timerLabels.bottom
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter

        }

        onDigitButtonPressed: refreshTimerText(number)
    }

    // Method for timer manipulation, takes an argument (the digitPressed)
    function refreshTimerText(number)
    {
        if (counter == 0) {
            digitFour = digitThree = digitTwo = digitOne = "0"
            digitOne = number
            ++counter
        }
        else if (counter == 1) {
            digitTwo = digitOne
            digitOne = number
            ++counter
        }
        else if (counter == 2) {
            digitThree = digitTwo
            digitTwo = digitOne
            digitOne = number
            ++counter
        }
        else if (counter == 3) {
            digitFour = digitThree
            digitThree = digitTwo
            digitTwo = digitOne
            digitOne = number
            counter = 0;
        }
    }
}
