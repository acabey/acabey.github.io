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



//FirstWindowWithButton.c

#include <gnome.h>

gint eventDestroy( GtkWidget* widget,  
                       GdkEvent* event,  gpointer data );         //(A)

int main( int argc, char* argv[] )                                //(B)
{
    GtkWidget*  topLevelWindow;                                   //(C)
    GtkWidget*  myButton;                                         //(D)

    gnome_init( "buttonwin", "1.0", argc, argv );                 //(E)
    topLevelWindow = gnome_app_new( 
                        "buttonwin", "My Window" );               //(F) 
    gtk_container_set_border_width( 
                   GTK_CONTAINER( topLevelWindow ), 100 );        //(G)
                                                               
    myButton = gtk_button_new_with_label( "Quit" );               //(H)
    gtk_signal_connect( GTK_OBJECT( myButton ),                   //(I)
                        "clicked", 
                        GTK_SIGNAL_FUNC( eventDestroy ), 
                        NULL );
    gnome_app_set_contents( 
               GNOME_APP( topLevelWindow ), myButton );           //(J)

    gtk_widget_show( topLevelWindow );                            //(K)
    gtk_main();                                                   //(L)
    exit( 0 );                                                    //(M)
}

gint eventDestroy( GtkWidget* widget,  
                       GdkEvent* event,  gpointer data ) {        //(N)
    gtk_main_quit();                                              //(O)
    return( 0 );                                                  //(P)
}
