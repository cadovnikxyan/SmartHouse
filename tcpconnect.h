#ifndef TCPCONNECT_H
#define TCPCONNECT_H
#include <QObject>
#include <QTcpSocket>

class TcpConnect : public QObject
{
public:
    Q_OBJECT
    TcpConnect();
   ~TcpConnect();
    void connecting();
private:
    QTcpSocket* socket;

signals:
    void connect();


};

#endif // TCPCONNECT_H
