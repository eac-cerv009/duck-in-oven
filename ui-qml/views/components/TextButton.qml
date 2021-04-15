import QtQuick 2.0
import QtQuick.Controls 2.0
import Themes 1.0

Button {
    id: textButton

    property alias textColor: label.color
    property alias radius: bg.radius
    property alias textFontSize: label.font.pointSize
    property alias textLeftMargin: label.anchors.leftMargin
    property alias textRightMargin: label.anchors.rightMargin
    property alias textTopMargin: label.anchors.topMargin
    property alias textBottomMargin: label.anchors.bottomMargin

    property bool showBorder: true
    property bool centerTextAligment: false

    implicitWidth: 233
    implicitHeight: 90

    hoverEnabled: false

    background: Rectangle {
        id: bg
        anchors.fill: parent
        radius: width / 2
        color: ColorTheme.textButtonBackgroundColor

        border {
            width: showBorder ? 1 : 0
            color: textButton.pressed ? ColorTheme.pressedStateColor
                                      : ColorTheme.defaultStateColor
        }
    }

    contentItem: Text {
        id: label
        anchors.fill: parent

        horizontalAlignment: centerTextAligment ? Text.AlignHCenter : Text.AlignLeft
        verticalAlignment: centerTextAligment ? Text.AlignVCenter : Text.AlignBottom

        font {
            family: TextStyle.familyFont
            pointSize: TextStyle.textButton_fontSize
            weight: TextStyle.textButton_fontWeight
        }
        color: textButton.pressed ? ColorTheme.pressedStateColor
                                  : ColorTheme.defaultStateColor

        text: textButton.text
    }
}
