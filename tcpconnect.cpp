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
    sio::client h;
    h.connect("http://127.0.0.1:3000");
    h.socket()->emit("login");
//    h.socket()->on("login",[&](){
//        qDebug()<<"login";
//    });
    timer= new QTimer();
    timer->start(200);
    qDebug()<<"qml receive";
    QObject::connect(timer,&QTimer::timeout,this,[&](){
        static QString str;
        if(str.length()<10){
            str+=".";
        }else{
            str=".";
        }
        qDebug()<<QmlInvoke("toolFooterUpdate",str);
    });
}

void TcpConnect::cpp(QString str)
{
    qDebug()<<str;
}

