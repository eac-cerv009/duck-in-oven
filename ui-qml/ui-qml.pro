QT += quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += src

SOURCES += \
        src/main.cpp

RESOURCES += qml.qrc \
  assets.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =  $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
  views/DefaultView.qml \
  views/CookBook.qml \
  views/ManualBake.qml \
  views/ManualTemperature.qml \
  views/ManualTemperatureTimerTabView.qml \
  views/ManualTimer.qml \
  views/Running.qml \
  views/CameraPreview.qml \
  views/panels/CenterPanel.qml \
  views/panels/LeftPanel.qml \
  views/panels/RightPanel.qml \
  views/panels/TopBarPanel.qml \
  views/panels/BottomBarPanel.qml
