import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Themes 1.0

TabButton {
    id: tabTitle

    width: implicitWidth + implicitWidth * .3
    height: 80

    background: Rectangle {
        implicitWidth: 40
        implicitHeight: 80
        color: "transparent"

        Rectangle {
            color: tabTitle.pressed ? ColorTheme.pressedStateColor :
                                                 (tabTitle.checked ? TextStyle.activeTab_color
                                                                              : TextStyle.inactiveTab_color)
            width: parent.width
            height: (tabTitle.checked || tabTitle.pressed) ? 3 : 0
            anchors.top: parent.top
        }
    }

    text: qsTr("Placeholder")
    contentItem: Label {
        text: tabTitle.text
        font.family: TextStyle.familyFont
        font.pixelSize: tabTitle.checked ? TextStyle.activeTab_fontSize : TextStyle.inactiveTab_fontSize
        font.weight: tabTitle.checked ? TextStyle.activeTab_fontWeight : TextStyle.inactiveTab_fontWeight
        color: tabTitle.pressed ? ColorTheme.pressedStateColor :
                                             (tabTitle.checked ? TextStyle.activeTab_color
                                                                          : TextStyle.inactiveTab_color)
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
