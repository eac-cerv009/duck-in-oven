import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0

Item {
    id: manualTemperatureView

    property int textMarginsValue: 20
    property int leftMarginValue: 60
    property int rightMarginValue: 60
    property int topMarginValue: 60

    Item {
        id: labelsRow

        width: parent.width
        height: 150

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: leftMarginValue
            rightMargin: rightMarginValue
            topMargin: topMarginValue
        }

        Text {
            id: temperatureText

            anchors {
                bottom: parent.bottom
                left: parent.left
                margins: textMarginsValue
            }

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.setTemperature_fontSize
                weight: TextStyle.setTemperature_fontWeight
            }
            color: TextStyle.setTemperature_color

            text: "425°F"
        }

        Text {
            id: timeText
            anchors {
                bottom: parent.bottom
                right: parent.right
                margins: textMarginsValue
            }

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.timer_fontSize
                weight: TextStyle.timer_fontWeight
            }
            color: TextStyle.timerRunning_color

            text: "01:30"   // TO DO C++ Conexion
        }
    }

    Item {
        id: timerInfo

        anchors {
            top: labelsRow.bottom
            bottom: parent.bottom
            left: labelsRow.left
            right: labelsRow.right
        }

        ProgressBar {
            id: control
            value: 0.5
            padding: 1

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            background: Rectangle {
                implicitWidth: 500
                implicitHeight: 15
                color: ColorTheme.timerInfoColor
                radius: height / 2
            }

            contentItem: Item {
                implicitWidth: 200
                implicitHeight: 4

                Rectangle {
                    width: control.visualPosition * parent.width
                    height: parent.height
                    radius: 2
                    color: ColorTheme.activedStateColor
                }
            }
        }



    }

    /*// ### SoB Dummy Area
//    Rectangle {
//        id: dummyRectangle
//        //            anchors.fill: parent
//        anchors {
//            top: labelsRow.bottom
//            bottom: parent.bottom
//            margins: 10
//        }
//        width: parent.width
//        height: parent.height
//        color: "yellow"
//        Text {
//            anchors.fill: parent

//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignVCenter

//            text: "Dummy Area"
//        }
//    }
    // ### EoB Dummy Area*/




}
