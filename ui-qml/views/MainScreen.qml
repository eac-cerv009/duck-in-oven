import QtQuick 2.9
import QtQuick.Window 2.2

import "panels"

Window {
    id: root
    visible: true

    width: 1920     //1024
    height: 548     //256

    title: qsTr("Duck In Oven - ICS")
    color: "#424241" //"#2F2F2F"

    LeftPanel {
        id: leftPanel

        width: 442//250
        height: parent.height
        anchors.left: parent.left
    }

    CenterPanel {
        id: centralPanel

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: leftPanel.right
            right: rightPanel.left
        }
    }

    RightPanel {
        id: rightPanel

        width: 442//250
        height: parent.height
        anchors.right: parent.right
    }
}
