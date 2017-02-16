#ifndef TCPCONNECT_H
#define TCPCONNECT_H
#include <QObject>
#include <QTcpSocket>

class TcpConnect : public QObject
{
    Q_OBJECT
public:
    TcpConnect(QObject* qml_);
   ~TcpConnect();
private:
    QTcpSocket* socket;
    QObject* qml;
public slots:
    void connecting();
    void cpp(QString str);

signals:
    void connect();


};

#endif // TCPCONNECT_H
