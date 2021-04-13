//TextStyle.qml
pragma Singleton

import QtQuick 2.0

QtObject {
    id: uiQmlTextStyle

    readonly property string familyFont: "Roboto"

    readonly property int statusText_fontSize: 50
    readonly property int statusText_fontWeight: Font.Light
    readonly property color statusText_color: "#F2F2F2"

    readonly property int timeText_fontSize: 49
    readonly property int timeText_fontWeight: Font.Light
    readonly property color timeText_color: "#F2F2F2"

    readonly property int mainTimeText_fontSize: 149
    readonly property int mainTimeText_fontWeight: Font.Bold
    readonly property color mainTimeText_color: "#F2F2F2"

    readonly property int dateText_fontSize: 49
    readonly property int dateText_fontWeight: Font.Light
    readonly property color dateText_color: "#FFFFFF"

    readonly property int textButton_fontSize: 38
    readonly property int textButton_fontWeight: Font.Normal
    readonly property color textButton_color: "#F2F2F2"

    readonly property int activeTab_fontSize: 38
    readonly property int activeTab_fontWeight: Font.Bold
    readonly property color activeTab_color: "#71E51A"

    readonly property int inactiveTab_fontSize: 37
    readonly property int inactiveTab_fontWeight: Font.Normal
    readonly property color inactiveTab_color: "#9C9C9C"

    readonly property int temperature_fontSize: 74
    readonly property int temperature_fontWeight: Font.Normal
    readonly property color temperature_color: "#71E51A"

    readonly property int temperatureUnitLabel_fontSize: 74
    readonly property int temperatureUnitLabel_fontWeight: Font.Normal
    readonly property color temperatureUnitLabel: "#E51A1A"

    readonly property int timer_fontSize: 74
    readonly property int timer_fontWeight: Font.Normal
    readonly property color timer_color: "#71E51A"
    readonly property color timerRunning_color: "#F2F2F2"

    readonly property int temperatureSelector_fontSize: 25
    readonly property int temperatureSelector_fontWeight: Font.Normal
    readonly property color temperatureSelector_color: "#F2F2F2"

    readonly property int setTemperature_fontSize: 50
    readonly property int setTemperature_fontWeight: Font.Normal
    readonly property color setTemperature_color: "#FFFFFF"

    readonly property int bottonBarText_fontSize: 24
    readonly property int bottonBarText_fontWeight: Font.Normal
    readonly property color bottonBarText_color: "#FFFFFF"

    readonly property int numDigitButtonText_fontSize: 36
    readonly property int numDigitButtonText_fontWeight: Font.Normal
    readonly property color numDigitButtonText_color: "#FFFFFF"

    readonly property string colourWhite: "white"
    readonly property string colourRed: "red"
    readonly property int fontPointSize: 80

}
