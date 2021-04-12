import QtQuick 2.0
import Themes 1.0

Rectangle {
    id: defaultView

    color: ColorTheme.centerPanelBackgroundColor

    Text {
        id: timeText
        anchors.horizontalCenter: parent.horizontalCenter

        font {
            family: TextStyle.familyFont
            pointSize: TextStyle.mainTimeText_fontSize
            weight: Font.Bold
        }
        color: TextStyle.mainTimeText_color

        text: masterController.ui_ovenControlState.ui_time
    }

    Text {
        id: dateText

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: timeText.bottom
        }

        font {
            family: TextStyle.familyFont
            pointSize: TextStyle.dateText_fontSize
            weight: Font.Light
        }
        color: TextStyle.dateText_color

        text:  masterController.ui_ovenControlState.ui_date

    }

}
