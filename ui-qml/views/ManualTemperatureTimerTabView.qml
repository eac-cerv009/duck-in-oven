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

//        width: parent.width; height: 180

//        anchors.top: parent.top
//        anchors.left: parent.left
//        anchors.right: parent.right

        color: "#2F2F2F"

        TabBar {
            id: bar
            width: parent.width;

            currentIndex: stackview_.currentIndex


            TabTitle {
                id: temperatureTabTitle

                text: qsTr("Temperature")
            }

            TabTitle {
                id: timerTabTitle

                text: qsTr("Timer")
            }
        }

        //SwipeView {
        StackLayout {
            id: stackview_
            width: parent.width; height: 100
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: bar.bottom
            anchors.bottom: parent.bottom
            currentIndex: bar.currentIndex

            ManualTemperatureView {
                id: temperatureTab
            }

            ManualTimerView {
                id: timerTab
            }
        }
    }
}
