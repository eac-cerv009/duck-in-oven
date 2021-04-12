import QtQuick 2.0
import QtQuick.Controls 2.0
import Themes 1.0

Rectangle {
    id: button

    property alias text: textButton.text
    property alias textColor: textButton.color
    property alias borderColor: button.border.color
    property alias textFontSize: textButton.font.pointSize
    property alias textLeftMargin: textButton.anchors.leftMargin
    property alias textRightMargin: textButton.anchors.rightMargin
    property alias textTopMargin: textButton.anchors.topMargin
    property alias textBottomMargin: textButton.anchors.bottomMargin

    property bool showBorder: true
    property bool centerTextAligment: false

    implicitWidth: 233
    implicitHeight: 90
    radius: 10
    color: ColorTheme.textButtonBackgroundColor//"#424241"
    border {
        width: showBorder ? 1 : 0
        color: ColorTheme.textButtonBorderColor
    }

    Text {
        id: textButton

        anchors {
            fill: parent
            leftMargin: 0
            bottomMargin: 0
        }

        font {
            family: TextStyle.familyFont
            pointSize: TextStyle.textButton_fontSize
            weight: TextStyle.textButton_fontWeight
        }
        color: TextStyle.textButton_color

        horizontalAlignment: centerTextAligment ? Text.AlignHCenter : Text.AlignLeft
        verticalAlignment: centerTextAligment ? Text.AlignVCenter : Text.AlignBottom

        text: "Dummy Text"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed: {
            textButton.color = ColorTheme.pressedStateColor
            button.border.color = ColorTheme.pressedStateColor
        }
        onClicked: {
            button.state == 'clicked' ?
                        button.state = "default" : button.state = 'clicked'
            //masterController.ui_controlFlow.

        }

    }

    /*states: [
        State {
            name: "pressed"; when: mouseArea.pressed
            PropertyChanges {
                target: button;
                textColor: "orange";
                borderColor: "orange"
            }
        },
        State {
            name: "clicked"; when: mouseArea.clicked
            PropertyChanges {
                target: button; border.color: "green"
            }
            PropertyChanges {
                target: textButton; color: "green"
            }
        }
    ]*/

    states: [
        State {
            name: "default"
            PropertyChanges {
                target: button; border.color: ColorTheme.defaultStateColor
            }
            PropertyChanges {
                target: textButton; color: ColorTheme.defaultStateColor
            }
        },
            State {
                name: "clicked"
                PropertyChanges {
                    target: button; border.color: ColorTheme.activedStateColor
                }
                PropertyChanges {
                    target: textButton; color: ColorTheme.activedStateColor
                }
            }
        ]
}

//Button {
//    id: button

//    //property alias text: textButton.text
//    property var isButtonTriggered: false

//    implicitWidth: 233
//    implicitHeight: 90
//    //            radius: width - 2
////    color: "#424241"
////    border.color: "#C4C4C4"
//    background: Rectangle {
//        radius: width - 2
//        color: "#424241"
//        border.color: "#C4C4C4"
//    }

//    text: "Aidali"
//}

