import QtQuick 2.0
import QtQuick.Controls 2.0
import Themes 1.0

Button {
    id: numericalDigitButton

    property bool showBorder: true
    property bool centerTextAligment: false

    implicitWidth: 60
    implicitHeight: 60

    hoverEnabled: false

    background: Rectangle {
        id: bg
        anchors.fill: parent
        radius: width / 2
        color: numericalDigitButton.pressed ? ColorTheme.pressedStateColor
                                            : ColorTheme.numDigitButtonBackgroundColor

        border {
            width: showBorder ? 1 : 0
            color: numericalDigitButton.pressed ? ColorTheme.pressedStateColor
                                                : ColorTheme.numDigitButtonBorderColor
        }
    }

    contentItem: Text {
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

        text: numericalDigitButton.text
    }
}
