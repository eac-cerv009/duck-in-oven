QT += qml quick \
        #quickcontrols2

TEMPLATE = app

CONFIG += c++14

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += src \
  ../lib/src

SOURCES += \
        src/main.cpp

RESOURCES += \
  views.qrc \
  views/assets/assets.qrc \
  icons/icons.qrc \
  Themes/themes.qrc

LIBS += -LC:\_dev\winDev\git\build-DuckInOven-Desktop_Qt_6_0_2_MinGW_64_bit-Debug\lib\debug -ldio-lib


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
  views/CameraPreviewView.qml \
  views/CookBookView.qml \
  views/DefaultView.qml \
  views/ManualBakeView.qml \
  views/ManualTemperatureTimerTabView.qml \
  views/ManualTemperatureView.qml \
  views/ManualTimerView.qml \
  views/RunningView.qml \
  views/components/NumericalDigitButton.qml \
  views/panels/CenterPanel.qml \
  views/panels/LeftPanel.qml \
  views/panels/RightPanel.qml \
  views/components/TopBar.qml \
  views/components/BottomBar.qml \
  views/components/IconButton.qml \
  views/components/TextButton.qml \
  views/components/NumberPad.qml

