// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.6  Minimalist GuI Programs In QT
//




//FirstWindow.cc

#include <qapplication.h>
#include <qmainwindow.h>

int main( int argc, char **argv )                                 //(A)
{
    QApplication myApp( argc, argv );                             //(B)

    QMainWindow* myWin = new QMainWindow( 0, 0, 0 );              //(C)
    myWin->resize( 500, 300 );                                    //(D)
    myWin->move( 200, 100 );                                      //(E)

    myApp.setMainWidget(myWin );                                  //(F)
    myWin->show();                                                //(G)
    return myApp.exec();                                          //(H)
}
