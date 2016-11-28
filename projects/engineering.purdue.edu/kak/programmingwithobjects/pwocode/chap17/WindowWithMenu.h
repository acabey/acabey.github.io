// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.17  Windows With Menus in Qt
//



////////////  file:  WindowWithMenu.h  ///////////

#ifndef WINDOWWITHMENU_H
#define WINDOWWITHMENU_H

#include <qmultilineedit.h>
#include <qmenubar.h>
#include <qpopupmenu.h>
#include <qcolor.h>
#include <qtextstream.h>
#include <qstatusbar.h>



enum BackgroundColor {
    BLUE,
    YELLOW,
    MAGENTA};


class WindowWithMenu: public QWidget
{
    Q_OBJECT
public:
    WindowWithMenu( QWidget *parent=0, const char* name= 0 );
    ~WindowWithMenu();
    void load( const char *fileName );
    void save( const char *fileName );


public slots:
    void allowTextEntry();
    void getTextFromFile();
    void saveTextToFile();

    void selectColor( int );


private:
    QMultiLineEdit* textarea;
    QMenuBar* menubar;
    QPopupMenu* filemenu;
    QPopupMenu* colormenu;
    const QColor* borderColor;
};

#endif

