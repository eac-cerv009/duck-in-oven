import QtQuick 2.0
import Themes 1.0

Rectangle {
    id: topBar

    property alias statusText: statusText
    property string text: statusText.text

    color: ColorTheme.topBarBackgroundColor

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
}
