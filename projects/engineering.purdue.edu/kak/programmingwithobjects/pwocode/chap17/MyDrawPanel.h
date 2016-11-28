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



////////////////  file:  MyDrawPanel.h  ///////////////

#ifndef MYDRAWPANEL_H
#define MYDRAWPANEL_H

#include <qwidget.h>


class MyDrawPanel: public QWidget
{
    Q_OBJECT
public:
    MyDrawPanel( QWidget *parent=0, const char* name= 0 );

    QSizePolicy sizePolicy() const;

    void paintEvent( QPaintEvent* );

public slots:
    void drawColoredSquare( char* );
};
#endif
