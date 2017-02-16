#ifndef TCPCONNECT_H
#define TCPCONNECT_H
#include <QObject>
#include <QTcpSocket>

class TcpConnect : public QObject
{
    Q_OBJECT
public:
    TcpConnect();
   ~TcpConnect();
private:
    QTcpSocket* socket;
public slots:
    void connecting();
    void cpp(QString str);

signals:
    void connect();


};

#endif // TCPCONNECT_H
