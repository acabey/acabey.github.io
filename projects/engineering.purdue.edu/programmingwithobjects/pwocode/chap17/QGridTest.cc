// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.10.2  Grid Layout
//



//QGridTest.cc

#include <qpushbutton.h>
#include <qgrid.h>
#include <qapplication.h>

class MyGrid : public QGrid {
public:
    MyGrid( int );
};

MyGrid::MyGrid( int cols ) :  QGrid( cols ) {
    setSpacing( 5 );
    setMargin( 10 );

    new QPushButton( "button1", this );
    new QPushButton( "button2", this );
    new QPushButton( "button3", this );
    new QPushButton( "button4", this );
    new QPushButton( "button5", this );
}


int main( int argc, char* argv[] )
{
    QApplication a( argc, argv );

    MyGrid* mg = new MyGrid( 2 );                                 //(A)
    mg->show();
    a.setMainWidget( mg );
    
    return a.exec();
}
