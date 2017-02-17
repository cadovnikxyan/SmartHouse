#include "tcpconnect.h"
#include <QDebug>
TcpConnect::TcpConnect(QObject *qml_):qml(qml_)
{
    socket = new QTcpSocket();
}

TcpConnect::~TcpConnect()
{
    delete socket;
}

QVariant TcpConnect::QmlInvoke(QString str)
{
    QVariant returnValue;
    QVariant msg= str;
    QMetaObject::invokeMethod(qml,"toolFooterUpdate",Q_RETURN_ARG(QVariant,returnValue),Q_ARG(QVariant,msg));
    return returnValue;
}

void TcpConnect::connecting()
{
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
        qDebug()<<QmlInvoke(str);
    });
}

void TcpConnect::cpp(QString str)
{
    qDebug()<<str;
}

void TcpConnect::toolbarUpdate(QString str)
{

}
