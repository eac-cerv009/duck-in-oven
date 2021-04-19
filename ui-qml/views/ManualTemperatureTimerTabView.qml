import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.15
import Themes 1.0

import "components"

Item {
    id: manualTemperatureTimerView

    objectName: "manualTemperatureTimerView"

    Connections {
        target: masterController.ui_controlFlow

        function onActionButtonBottomBarClicked() {
            if (stackview.currentIndex == 0) {
                bar.currentIndex = 1
                masterController.ui_ovenControlState.ovenTemperatureChoosen(temperatureTab.selectedTemperature);
            }
            else if (stackview.currentIndex == 1) {
                masterController.ui_ovenControlState.ovenTimerChoosen(timerTab.selectedTime);
                masterController.ui_controlFlow.goRunningView();
            }
        }
    }

    Rectangle {
        id: content

        anchors.fill: parent

        color: ColorTheme.centerPanelBackgroundColor

        TabBar {
            id: bar
            width: parent.width;

            currentIndex: stackview.currentIndex

            TabTitle {
                id: temperatureTabTitle

                text: qsTr("Temperature")
            }

            TabTitle {
                id: timerTabTitle

                text: qsTr("Timer")

                onClicked: masterController.ui_ovenControlState.ovenTemperatureChoosen(temperatureTab.selectedTemperature);
            }
        }

        StackLayout {
            id: stackview

            anchors {
                left: parent.left
                right: parent.right
                top: bar.bottom
                bottom: parent.bottom
            }

            currentIndex: bar.currentIndex

            TemperatureSelector {
                id: temperatureTab
            }

            TimerSelector {
                id: timerTab
            }
        }
    }
}
