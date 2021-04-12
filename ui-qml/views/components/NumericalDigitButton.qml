import QtQuick 2.0
import QtQuick.Controls 2.0
import Themes 1.0

Rectangle {
    id: button

    property alias text: digit.text
    property alias textColor: digit.color
    property alias borderColor: button.border.color

    property bool showBorder: true
    property bool centerTextAligment: false

    implicitWidth: 60
    implicitHeight: 60
    radius: width / 2
    color: ColorTheme.numDigitButtonBackgroundColor
    border {
        width: showBorder ? 1 : 0
        color: ColorTheme.numDigitButtonBorderColor
    }

    Text {
        id: digit
        anchors.fill: parent

        horizontalAlignment: centerTextAligment ? Text.AlignHCenter : Text.AlignLeft
        verticalAlignment: centerTextAligment ? Text.AlignVCenter : Text.AlignBottom

        font {
            family: TextStyle.familyFont
            pointSize: TextStyle.numDigitButtonText_fontSize
            weight: TextStyle.numDigitButtonText_fontWeight
        }
        color: TextStyle.numDigitButtonText_color

        text: "#"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            digit.color = ColorTheme.pressedStateColor
            button.border.color = ColorTheme.pressedStateColor
        }
    }
}
