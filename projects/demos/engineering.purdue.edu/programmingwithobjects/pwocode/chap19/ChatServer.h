// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 19  Network Programming
//
// Section:     Section 19.4  Server Sockets In C++ (Qt)
//



//ChatServer.h

#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <qserversocket.h>
#include <qsocket.h>
#include <qtextstream.h>
#include <qstring.h>
#include <vector>
using namespace std;

class ChatServer;

class ClientHandler : public QObject {
    Q_OBJECT
    QSocket* handlerSocket;
    QString* chatName;
    ChatServer* chatServer;
    QTextStream* os;
public:
    ClientHandler( QSocket* sock, ChatServer* cserver );
    ClientHandler();
    ClientHandler( const ClientHandler& cl );
    ClientHandler& operator=( const ClientHandler& other );
    ~ClientHandler();
private slots:
    void readFromClient();
    void reportError( int );
};


class ChatServer : public QServerSocket {
    Q_OBJECT
public:
    vector<ClientHandler> clientVector;
    ChatServer( int port );
    void newConnection( int socketFD );
    ~ChatServer();
};
#endif
