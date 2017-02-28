TEMPLATE = app

QT += qml quick network xml

CONFIG += c++14
CONFIG+=no_keywords
SOURCES += main.cpp \
    tcpconnect.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    tcpconnect.h



#RESOURCES += \
#    ../../icons/cable.png \
#    ../../icons/cable1.png \
#    ../../icons/chip-1.png \
#    ../../icons/chip.png \
#    ../../icons/computer.png \
#    ../../icons/cpu.png \
#    ../../icons/download.png \
#    ../../icons/edit.png \
#    ../../icons/photo-camera.png \
#    ../../icons/reload.png \
#    ../../icons/settings-1.png \
#    ../../icons/settings.png


QMAKE_CFLAGS +="-std-c++14"


INCLUDEPATH += $$PWD/libs/socket.io/include
DEPENDPATH += $$PWD/libs/socket.io/include

unix:!macx: LIBS += -L$$PWD/libs/socket.io/lib/Release/ -lsioclient
unix:!macx: PRE_TARGETDEPS += $$PWD/libs/socket.io/lib/Release/libsioclient.a

unix:!macx: LIBS += -L$$PWD/libs/socket.io/lib/Release/ -lsioclient_tls
unix:!macx: PRE_TARGETDEPS += $$PWD/libs/socket.io/lib/Release/libsioclient_tls.a


unix:!macx: LIBS += -L$$PWD/libs/socket.io/lib/Release/ -lboost_date_time
unix:!macx: PRE_TARGETDEPS += $$PWD/libs/socket.io/lib/Release/libboost_date_time.a

unix:!macx: LIBS += -L$$PWD/libs/socket.io/lib/Release/ -lboost_random
unix:!macx: PRE_TARGETDEPS += $$PWD/libs/socket.io/lib/Release/libboost_random.a

unix:!macx: LIBS += -L$$PWD/libs/socket.io/lib/Release/ -lboost_system
unix:!macx: PRE_TARGETDEPS += $$PWD/libs/socket.io/lib/Release/libboost_system.a
