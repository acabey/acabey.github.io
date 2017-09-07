// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.7  Minimalist Programs In GNOME/GTK+
//



//FirstWindow.c

#include <gnome.h>

int main( int argc, char* argv[] )                                //(A)
{
    GtkWidget*  topLevelWindow;                                   //(B)

    gnome_init( "gnomewin", "1.0", argc, argv );                  //(C)
    topLevelWindow = gnome_app_new( "gnomewin", 
                                    "Gnome Window" );             //(D)
    gtk_container_set_border_width( 
                    GTK_CONTAINER( topLevelWindow ), 200 );       //(E)
    gtk_widget_show( topLevelWindow );                            //(F)
    gtk_main();                                                   //(G)
    exit( 0 );                                                    //(H)
}
