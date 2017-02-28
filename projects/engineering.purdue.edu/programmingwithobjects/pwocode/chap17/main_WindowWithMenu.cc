// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.17  Windows with Menus in Qt
//



//////////  file:  main_WindowWithMenu.cc  ////////////


#include <qapplication.h>
#include "WindowWithMenu.h"

int main( int argc, char ** argv ) {
    QApplication a( argc, argv );
    WindowWithMenu* m = new WindowWithMenu();
    m->setGeometry( 100, 200, 400, 400 );
    m->setCaption( "Window with Menu" );
    a.setMainWidget( m );
    m->show();
    a.connect( &a, SIGNAL(lastWindowClosed()), &a, SLOT(quit()) );
    return a.exec();
}
