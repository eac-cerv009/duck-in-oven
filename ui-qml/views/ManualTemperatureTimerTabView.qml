import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0

import "components"

Item {
    id: manualTemperatureTimerView

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
