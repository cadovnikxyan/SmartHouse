#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "tcpconnect.h"
#include <QSignalMapper>
#include <sio_client.h>
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
