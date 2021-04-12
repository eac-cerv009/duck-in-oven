import QtQuick 2.0
import QtQuick.Controls 2.0
import Themes 1.0

Button {
    id: iconButton

    property alias iconImageSource: iconButton.icon.source
    property int iconSize: 60
    property alias borderColor: bg.border.color
    property alias borderWidth: bg.border.width

    property bool showBorder: false
    property bool showBackground: false

    implicitWidth: 60; implicitHeight: 60

    width: parent.width; height: parent.height

    hoverEnabled: false
    checkable: true
    enabled: false

//    leftPadding: 4
//    rightPadding: 4
//    topPadding: 12
//    bottomPadding: 12

    background:     Rectangle {
        id: bg
        anchors.fill: parent
        radius: width / 2
        color: showBackground ? ColorTheme.iconButtonBackgroundColor : "transparent"
        border {
            color: ColorTheme.iconButtonBorderColor
            width: showBorder ? 3 : 0
        }
    }

    display: Button.IconOnly
    icon.name: "placeholder"
    icon.color: iconButton.enabled ? ColorTheme.disabledStateColor
                              :(iconButton.pressed ? ColorTheme.pressedStateColor
                                                   :(iconButton.checked ? ColorTheme.activedStateColor
                                                                        : ColorTheme.defaultStateColor)
                                    )

//    icon.width: parent.width
//    icon.height: parent.height

}
