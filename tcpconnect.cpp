#include "tcpconnect.h"

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

}
