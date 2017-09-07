// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.14.1  A Qt Exammple that Requires Meta Object Compilation
//




///////////////   file:  main_CrazyWindow.cc   /////////////

#include <qapplication.h>

#include "CrazyWindow.h"

int main( int argc, char ** argv ) {
    QApplication::setColorSpec( QApplication::CustomColor );
    QApplication a( argc, argv );

    CrazyWindow w;
    w.setGeometry( 0, 0, 700, 500 );
    a.setMainWidget( &w );
    w.show();
    a.connect( &a, SIGNAL(lastWindowClosed()), &a, SLOT(quit()) );
    return a.exec();
}
