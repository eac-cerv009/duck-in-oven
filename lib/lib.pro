QT -= gui

TARGET = dio-lib
TEMPLATE = lib
DEFINES += LIB_LIBRARY

CONFIG += c++14

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += src/

SOURCES += \
    src/controllers/mastercontroller.cpp \
    src/controllers/ovencontrolstate.cpp \
    src/models/handler.cpp

HEADERS += \
    src/controllers/ovencontrolstate.h \
    src/controllers/uicontrolflow.h \
    src/lib_global.h \
    src/controllers/mastercontroller.h \
    src/models/handler.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target
