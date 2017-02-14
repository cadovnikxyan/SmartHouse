#include "tcpconnect.h"
#include <QDebug>
TcpConnect::TcpConnect()
{
    socket = new QTcpSocket();
}

TcpConnect::~TcpConnect()
{
    delete socket;
}

void TcpConnect::connecting()
{
    qDebug()<<"qml receive";
}
