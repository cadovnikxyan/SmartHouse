#ifndef TCPCONNECT_H
#define TCPCONNECT_H
#include <QObject>
#include <QTcpSocket>
#include <QTimer>

class TcpConnect : public QObject
{
    Q_OBJECT
public:
    TcpConnect(QObject* qml_);
   ~TcpConnect();
private:
    QTcpSocket* socket;
    QObject* qml;
    QVariant QmlInvoke(const QString &method, const QVariant &msg);
    QTimer* timer;


public slots:
    void connecting();
    void cpp(QString str);
    void toolbarUpdate(QString str);

signals:
    void connect();


};

#endif // TCPCONNECT_H
