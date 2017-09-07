// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.15  Event Processing In GNOME/GTK+
//


//WindowWithHelloButton.c

#include <gnome.h>

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data );
void sayHello( GtkWidget* widget, GdkEvent* event, gpointer data );

int main( int argc, char* argv[] )
{
    GtkWidget* window;
    GtkWidget* myButton;

    gnome_init( "hellobutton", "1.0", argc, argv );
    window = gnome_app_new( 
                     "hellobutton", "Window with Hello Button" );
    gtk_container_set_border_width( 
                       GTK_CONTAINER( window ), 100 );            //(A)
    gtk_signal_connect( GTK_OBJECT( window ),
                        "destroy",
                        GTK_SIGNAL_FUNC( eventDestroy ),
                        NULL );
    myButton = gtk_button_new_with_label( "Say Hello" );          //(B)
    gtk_signal_connect( GTK_OBJECT( myButton ),                   //(C)
                        "clicked",
                        GTK_SIGNAL_FUNC( sayHello ),
                        NULL );
    gnome_app_set_contents( GNOME_APP( window ), myButton );
    gtk_widget_show_all( window );
    gtk_main();
    exit( 0 );
}

void sayHello(GtkWidget* widget, GdkEvent* event, gpointer data){ //(D)
    g_print( "Hello from GNOME/GTK+\n" );
}

gint eventDestroy(GtkWidget* widget, GdkEvent* event, gpointer data) {
    gtk_main_quit();
    return 0;
}
