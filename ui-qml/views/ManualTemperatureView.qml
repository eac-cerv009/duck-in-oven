import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0

Item {
    id: manualTemperatureView

    Row {
        id: temperatureRow

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            margins: 10
        }

        Text {
            id: temperatureText

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.temperature_fontSize
                weight: TextStyle.temperature_fontWeight
            }
            color: TextStyle.temperature_color

            text: "425"     //To Do C++ Conexion
        }

        Text {
            id: temperatureUnit

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.temperatureUnitLabel_fontSize
                weight: TextStyle.temperatureUnitLabel_fontWeight
            }
            color: TextStyle.temperatureUnitLabel

            text: "°F"      // TODO C++ Conection
        }
    }

    // ### SoB Dummy Area
    Rectangle {
        id: dummyRectangle
        //            anchors.fill: parent
        width: parent.width
        height: parent.height
        anchors {
            top: temperatureRow.bottom
            bottom: parent.bottom
            margins: 10
        }

        border {
            width: 10
            color: "black" // "magenta"
        }

        color: "yellow"
        Text {
            anchors.fill: parent

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            text: "Dummy Area"
        }
    }
    // ### EoB Dummy Area

}
