#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "tcpconnect.h"
void cpp(QString str){
    qDebug()<<str;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    auto items = engine.rootObjects();
    auto item = items.first()->findChild<QObject*>("RightPage");
    for(auto it=0;it<items.size();++it){
        if(items.at(it)!=0){
            qDebug()<<items.at(it)->objectName();
        }

    }
    TcpConnect* tcp = new TcpConnect();
    QObject::connect(item,SIGNAL(qmlSignal(QString)),tcp,SLOT(TcpConnect::connect));
    QObject::connect(item,SIGNAL(qmlSignal(QString)),tcp,SLOT(cpp(QString)));
    return app.exec();
}
