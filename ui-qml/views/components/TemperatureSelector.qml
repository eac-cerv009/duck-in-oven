import QtQuick 2.12
import QtQuick.Controls 2.12

import Themes 1.0

Item {

    id: temperatureSelector

    property int largeTicksNum : 7
    property int largeTickWidth: 5
    property int smallTicksNum : 31
    property int smallTickWidth: 3
    property int tempLabelsNum : largeTicksNum

    property int minTemp:   350
    property int maxTemp:   500

    Row {
        id: temperatureLabels
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: selectedTemperatureText

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.temperature_fontSize
                weight: TextStyle.temperature_fontWeight
            }
            color: TextStyle.temperature_color

            text: Math.round(control.value)
        }

        Text {
            id: temperatureUnit

            font {
                family: TextStyle.familyFont
                pointSize: TextStyle.temperatureUnitLabel_fontSize
                weight: TextStyle.temperatureUnitLabel_fontWeight
            }
            color: TextStyle.temperatureUnitLabel

            text: "°F"      // TODO Setting
        }
    }

    Item {

        width: parent.width
        anchors {
            top: temperatureLabels.bottom
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }

        Slider {
            id: control

            from: minTemp
            to: maxTemp
            value: 400

            anchors {
                horizontalCenter:  parent.horizontalCenter
                top: parent.top
                topMargin: 10
            }

            background: Rectangle {
                id: backgroundControl
                x: control.leftPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitWidth: 960
                implicitHeight: 85
                width: control.availableWidth
                height: implicitHeight
                radius: 2
                color: ColorTheme.temperatureSelectorBackgroundColor

                Row {
                    id: smallTicksRow

                    width: control.availableWidth - (tempSelector.width + smallTicksNum * smallTickWidth)
                    spacing: width / (smallTicksNum - 1)
                    leftPadding: - (tempSelector.width / 2)

                    height: parent.height * .5
                    anchors {
                        left: largeTicksRow.left
                        verticalCenter: largeTicksRow.verticalCenter
                    }

                    Repeater {
                        model: smallTicksNum
                        Rectangle {
                            width: smallTickWidth; height: parent.height
                            color: "grey"
                        }
                    }
                }

                Row {
                    id: largeTicksRow
                    width: control.availableWidth - (tempSelector.width + largeTicksNum * largeTickWidth)

                    spacing: width / (largeTicksNum - 1)
                    leftPadding: - (tempSelector.width / 2)
                    z: 1

                    height: parent.height * .9
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    Repeater {
                        model: largeTicksNum
                        Rectangle {
                            id: largeTick
                            width: largeTickWidth; height: parent.height
                            color: "black"
                        }
                    }
                }

                Row {
                    id: scaleRow
                    width: control.availableWidth - (tempSelector.width)

                    leftPadding: - ((largeTicksRow.spacing + largeTickWidth) / 2)

                    height: 25
                    anchors {
                        top: backgroundControl.bottom
                        horizontalCenter: parent.horizontalCenter
                    }

                    Repeater {
                        model: ["350°F", "375°F", "400°F", "425°F", "450°F", "475°F", "500°F"]
                        Rectangle {
                            id: tempLabel

                            height: parent.height
                            width: largeTicksRow.spacing + largeTickWidth

                            color: "transparent"
                            opacity: 0.5

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                font {
                                    family: TextStyle.familyFont
                                    pointSize: TextStyle.temperatureSelector_fontSize
                                    weight: TextStyle.temperatureSelector_fontWeight
                                }
                                color: TextStyle.temperatureSelector_color

                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                text: modelData
                            }
                        }

                    }
                }
            }

            handle: Rectangle {
                id: tempSelector
                x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                y: control.topPadding - 5
                implicitWidth: 44
                implicitHeight: 44
                color: "transparent"
                Image {
                    id: iconTempSelector
                    source: "/images/tempSelector.png"
                }
            }

            onMoved: selectedTemperatureText.text = Math.round(control.value)
        }

    }
}


