// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.11.1  Box Layout
//




//GHBoxTest.c

#include <gnome.h>

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data );

int main( int argc, char* argv[] )
{
    GtkWidget* window;
    GtkWidget* hbox; 
    GtkWidget* button;

    gnome_init( "HorizBoxTest", "1.0", argc, argv );
 
    window = gtk_window_new( GTK_WINDOW_TOPLEVEL );

    gtk_signal_connect( GTK_OBJECT( window ),
                        "destroy",
                        GTK_SIGNAL_FUNC( eventDestroy ),
                        NULL );
                                
    gtk_container_set_border_width( GTK_CONTAINER( window ), 25 );

    hbox = gtk_hbox_new( TRUE, 10 );                              //(A)

    button = gtk_button_new_with_label( "Hi" );
    gtk_box_pack_start( GTK_BOX(hbox), button, FALSE, TRUE, 0 );  //(B)

    button = gtk_button_new_with_label( "Hello" );
    gtk_box_pack_start( GTK_BOX( hbox ), button, TRUE, FALSE, 0 );

    button = gtk_button_new_with_label( "Hi There" );
    gtk_box_pack_start( GTK_BOX( hbox ), button, FALSE, FALSE, 0 );

    button = gtk_button_new_with_label( "Hello There" );
    gtk_box_pack_start( GTK_BOX( hbox ), button, TRUE, TRUE, 0 );

    gtk_container_add( GTK_CONTAINER( window ), hbox );
 
    gtk_widget_show_all( window );
    gtk_main();
    exit( 0 );
}                    

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data ){
    gtk_main_quit();
    return 0;
}        
