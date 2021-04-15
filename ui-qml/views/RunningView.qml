import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.15
import Themes 1.0

Item {
    id: runningView

    objectName: "runningView"

    property int textMarginsValue: 20
    property int leftMarginValue: 60
    property int rightMarginValue: 60
    property int topMarginValue: 60
    property int progressBarResolution: 1000
    property int progressBarRefreshPeriod: masterController.ui_ovenControlState.ui_selectedTime / progressBarResolution
    property int remainingTime: progressBarResolution

    Connections {
        target: masterController.ui_controlFlow

        function onActionButtonBottomBarClicked() {
            masterController.ui_ovenControlState.runningButtonPressed()
        }
    }

    Connections {
        target: masterController.ui_ovenControlState

        function onOvenRunningStateChanged() {
            refreshProgressBarTimer.running = masterController.ui_ovenControlState.ui_ovenRunning ? true : false
        }
    }

    Timer {
        id: refreshProgressBarTimer
        interval: progressBarRefreshPeriod
        running: false
        repeat: true
        onTriggered: --remainingTime
    }

    Timer {
        interval: 6000
        running: masterController.ui_ovenControlState.ui_ovenRunning
        repeat: true
        onTriggered: --remainingTime
    }


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
            id: temperatureLabel

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

            text: masterController.ui_ovenControlState.ui_temperature + " °F"
        }

        Text {
            id: timeLeftLabel
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

            text: masterController.ui_ovenControlState.ui_timerTimeLeft
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

            from: 0
            value: remainingTime
            to: progressBarResolution
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
}
