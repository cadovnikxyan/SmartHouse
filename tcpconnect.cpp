#include "tcpconnect.h"
#include <QDebug>
#include <QtXml>
#include <sio_client.h>
TcpConnect::TcpConnect(QObject *qml_):qml(qml_)
{
    socket = new QTcpSocket();
}

TcpConnect::~TcpConnect()
{
    delete socket;
}

QVariant TcpConnect::QmlInvoke(const QString& method,const QVariant& msg)
{
    QVariant returnValue;
    QMetaObject::invokeMethod(qml
                              ,method.toStdString().c_str()
                              ,Q_RETURN_ARG(QVariant,returnValue)
                              ,Q_ARG(QVariant,msg));
    return returnValue;
}

void TcpConnect::connecting()
{
    sio::client* h= new sio::client();
    h->connect("http://127.0.0.1:3000");
    h->socket()->emit("event",QString("hello from qt!").toStdString());
    h->socket()->on("login", [&](sio::event& ev){
        qDebug()<<"login";
//        qDebug()<<ev.get_name();

    });
    timer= new QTimer();
    timer->start(1000);
    qDebug()<<"qml receive";
    QObject::connect(timer,&QTimer::timeout,this,[&,h](){
        static QString str;
        if(str.length()<10){
            str+=".";
        }else{
            str=".";
        }
        qDebug()<<QmlInvoke("toolFooterUpdate",str);
        delete h;
    });
}

void TcpConnect::cpp(QString str)
{
    qDebug()<<str;
}

