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




///////////////     file:  CrazyWindow.h   ///////////////

#ifndef CRAZYWINDOW_H
#define CRAZYWINDOW_H

#include <qwidget.h>

class CrazyWindow: public QWidget                          // (A)
{
public:
    CrazyWindow( QWidget *parent=0, const char* name= 0 );
};

#endif

