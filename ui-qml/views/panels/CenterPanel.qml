import QtQuick 2.0
import QtQuick.Controls 2.2

import "../components"

Item {

    property var topBarHeightFactor: 0.18
    property var  bottomBarHeightFactor: 0.16

    TopBar {
        id: topBar

        height: parent.height * topBarHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    StackView {
        id: centerPanel

        anchors {
            top: topBar.bottom
            bottom: bottomBar.top
            left: parent.left
            right: parent.right
        }

        //initialItem: "qrc:/views/DefaultView.qml"
        initialItem: "qrc:/views/ManualTemperatureTimerTabView.qml"
    }

    BottomBar {
        id: bottomBar

        height: parent.height * bottomBarHeightFactor
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}


