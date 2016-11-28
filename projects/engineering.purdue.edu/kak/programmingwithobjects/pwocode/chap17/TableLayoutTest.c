// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.11.2  Table Layout
//



//TableLayoutTest.c

#include <gnome.h>

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data );  

int main( int argc, char* argv[] )
{
    GtkWidget* window;
    GtkWidget* table; 
    GtkWidget* button;

    gnome_init( "TableLayoutTest", "1.0", argc, argv );
 
    window = gtk_window_new( GTK_WINDOW_TOPLEVEL );
    gtk_signal_connect( GTK_OBJECT( window ),
                        "destroy",
                        GTK_SIGNAL_FUNC( eventDestroy ),
                        NULL );
    gtk_container_set_border_width( GTK_CONTAINER( window ), 25 );

    table = gtk_table_new( 2, 3, TRUE );  //rows, cols, homogeneous

    button = gtk_button_new_with_label( "Hi" );
    gtk_table_attach_defaults( GTK_TABLE(table), button, 0, 1, 0, 1 );
                                                                  //(A)
    button = gtk_button_new_with_label( "Hello" );
    gtk_table_attach_defaults( GTK_TABLE(table), button, 1, 2, 0, 1 );

    button = gtk_button_new_with_label( "Hi There" );
    gtk_table_attach_defaults( GTK_TABLE(table), button, 2, 3, 0, 1 );

    button = gtk_button_new_with_label( "Hello There" );          //(B)
    gtk_table_attach_defaults( GTK_TABLE(table), button, 0, 3, 1, 2 );

    gtk_container_add( GTK_CONTAINER( window ), table );
 
    gtk_widget_show_all( window );
    gtk_main();
    exit( 0 );
}                    

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data ){
    gtk_main_quit();
    return 0;
}        
