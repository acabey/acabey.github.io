// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 18  Multithreaded Object-Oriented Programming
//
// Section:     Section 18.11  Object-Oriented Multithreading In C++
//


//HelloThreadWithJoin.cc

#include <qthread.h>
#include <string>
#include <iostream>
using namespace std;


class HelloThread : public QThread {
    string message;
public:
    HelloThread( string message ) { this->message = message; }
    void run() { cout << message; }
};

int main()
{
    HelloThread ht1( "Good " );
    HelloThread ht2( "Morning " );
    HelloThread ht3( "to " );

    ht1.start();
    ht2.start();
    ht3.start();

    ht1.wait();
    ht2.wait();
    ht3.wait();
    cout << "you!" << endl;

    return 0;
}
