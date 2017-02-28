// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 19  Network Programming
//
// Section:     Section 19.3  Establishing Socket Connections With Existing Servers In C++
//




//ClientSocket.h

#ifndef CLIENTSOCKET_H
#define CLIENTSOCKET_H

#include <qsocket.h>
#include <string>
using namespace std;

class ClientSocket : public QSocket {
    Q_OBJECT
    string wwwName;
    QSocket* socket;
public:
    ClientSocket( string wwwName );
    string constructHttpRequest();
    void socketClosed();
    ~ClientSocket();
public slots:
    void reportConnected();                                       //(A)
    void reportHostFound();                                       //(B)
    void getWebPage();                                            //(C)
    void socketConnectionClosed();                                //(D)
    void reportError( int );                                      //(E)
};

#endif
