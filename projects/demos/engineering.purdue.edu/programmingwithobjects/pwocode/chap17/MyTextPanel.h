// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.14.1  A Qt Exammple that Requires Meta Object Compilation
//





////////////////  file:  MyTextPanel.h  ///////////////

#ifndef MYTEXTPANEL_H
#define MYTEXTPANEL_H

#include <qmultilineedit.h>


class MyTextPanel: public QMultiLineEdit
{
    Q_OBJECT

public:
    MyTextPanel( QWidget *parent=0, const char* name= 0 );

signals:
    //This signal is connected in class CrazyWindow 
    //with slot function drawColoredSquare of class 
    //MyDrawPanel in line (F)
    void userTypedKeyword( char* );                      // (G)

public slots:
    //The signal textChanged() emitted by an object
    //of type "this" is connected to this slot function
    //in this class in line (I)
    void doSomethingTextChanged();

private:
    QString word;
};
#endif
