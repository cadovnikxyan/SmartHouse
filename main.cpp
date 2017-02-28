#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "tcpconnect.h"
#include <QSignalMapper>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    auto items = engine.rootObjects();
    auto item = items.first()->findChild<QObject*>("rightBnt");
    auto mainWindow= items.first();
    auto signalMapper= new QSignalMapper();
    signalMapper->setMapping(item,"qmlSignal");


    TcpConnect* tcp = new TcpConnect(mainWindow);
    QObject::connect(item,SIGNAL(qmlSignal(QString)),tcp,SLOT(connecting()));
    QObject::connect(item,SIGNAL(qmlSignal(QString)),tcp,SLOT(cpp(QString)));

    return app.exec();
}


/*

установка socket.io-cpp
git clone --recurse-submodules https://github.com/socketio/socket.io-client-cpp.git
cd socket.io-client-cpp

cmake -DBOOST_ROOT=../..//home/alexey/boost_1_63_0/stage/lib -DBOOST_VER=1.63

make install

*/
