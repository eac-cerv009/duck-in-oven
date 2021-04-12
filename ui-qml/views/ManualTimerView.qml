import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0
import "components"

Item {
    id: manualTemperatureView

    Row {
        id: timerRow

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            margins: 10
        }
        Text {
            id: temperatureText

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.timer_fontSize
                weight: TextStyle.timer_fontWeight
            }
            color: TextStyle.timer_color

            text: "HH:MM"   // TODO C++ Conection
        }
    }

    NumberPad {
        id: numberPad

        width: parent.width / 2
        anchors {
            top: timerRow.bottom
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 10
        }
    }
}
