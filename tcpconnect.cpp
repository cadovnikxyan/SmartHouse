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

void TcpConnect::connecting()
{
    QVariant returnValue;
    QVariant msg= "message from c++";
    QMetaObject::invokeMethod(qml,"myQmlFunction",Q_RETURN_ARG(QVariant,returnValue),Q_ARG(QVariant,msg));
    qDebug()<<"qml receive";
    qDebug()<<returnValue.toString();
}

void TcpConnect::cpp(QString str)
{
    qDebug()<<str;
}
