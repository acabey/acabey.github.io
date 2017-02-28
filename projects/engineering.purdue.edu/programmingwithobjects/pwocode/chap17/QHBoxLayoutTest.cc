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



//QHBoxLayoutTest.cc

#include <qdialog.h>
#include <qpushbutton.h>
#include <qlayout.h>
#include <qapplication.h>

class MyDialog : public QDialog {
public:
    MyDialog();
};

MyDialog::MyDialog() {
    QPushButton* b1 = new QPushButton( "button1", this );         //(A) 
    b1->setMinimumSize( b1->sizeHint() );                         //(B)
    QPushButton* b2 = new QPushButton( "button2", this );    
    b2->setMinimumSize( b2->sizeHint() );
    QPushButton* b3 = new QPushButton( "button3", this );
    b3->setMinimumSize( b3->sizeHint() );

    QHBoxLayout* layout = new QHBoxLayout( this );
    layout->addWidget( b1 );                                      //(C)
    layout->addWidget( b2 );
    layout->addWidget( b3 );
    layout->activate();                                           //(D)
}


int main( int argc, char* argv[] )
{
    QApplication a( argc, argv );

    MyDialog* dlg = new MyDialog();
    dlg->show();
    a.setMainWidget( dlg );
    
    return a.exec();
}
