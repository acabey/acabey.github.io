// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.10.1  Box Layout
//


//QHBoxTest.cc
#include <qpushbutton.h>
#include <qhbox.h>
#include <qapplication.h>

class MyHBox : public QHBox {
public:
    MyHBox();
};

MyHBox::MyHBox() {
    setSpacing( 5 );                                              //(A)
    setMargin( 10 );                                              //(B)

    new QPushButton( "button1", this );                           //(C)
    new QPushButton( "button2", this );                           //(D)
    new QPushButton( "button3", this );                           //(E)
}

int main( int argc, char* argv[] )
{
    QApplication a( argc, argv );

    MyHBox* hb = new MyHBox();
    hb->show();
    a.setMainWidget( hb );
    
    return a.exec();
}
