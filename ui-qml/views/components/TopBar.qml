import QtQuick 2.15
import Themes 1.0

Rectangle {
    id: topBar

    property alias statusText: statusText
    property string text: statusText.text

    color: ColorTheme.topBarBackgroundColor

    Connections {
        target: masterController.ui_ovenControlState

        function onOvenPowerStateChanged() {
            if (masterController.ui_ovenControlState.ui_ovenTurnedOn) {
                statusText.opacity = 1
                statusText.text = qsTr("Let's cook ...")
            }
            else {
                statusText.text = qsTr("See you next time!")
                refreshStatusText.running = true
            }

        }
    }

    Text {
        id: statusText

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: 10
            //verticalCenter: parent.verticalCenter
        }

        font {
            family: TextStyle.familyFont
            pointSize: TextStyle.statusText_fontSize
            weight: TextStyle.statusText_fontWeight
        }
        color: TextStyle.statusText_color

        verticalAlignment: Text.AlignVCenter
        text: qsTr("")
    }

    Text {
        id: timeTextTopBar

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            margins: 10
            //verticalCenter: parent.verticalCenter
        }

        font {
            family: TextStyle.familyFont
            pointSize: TextStyle.timeText_fontSize
            weight: Font.Light
        }
        color: TextStyle.timeText_color

        verticalAlignment: Text.AlignVCenter
        text: masterController.ui_ovenControlState.ui_time
    }

    Timer {
        id: refreshStatusText
        interval: 3000
        repeat: false
        onTriggered: opacityAnimatorStatusText.running = true
        //onTriggered: statusText.text = qsTr("")
    }

    OpacityAnimator {
        id: opacityAnimatorStatusText
        target: statusText;
        from: 1;
        to: 0;
        duration: 250
    }
}
