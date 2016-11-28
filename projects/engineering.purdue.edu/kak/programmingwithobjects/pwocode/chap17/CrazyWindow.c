// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.15.1  Communicating Events to Other Widgets in GNOME/GTK+
//




//CrazyWindow.c

#include <gnome.h>
#include <stdio.h>
#include <stdlib.h>       // for rand()
#include <time.h>         // for seed for rand()

GtkWidget* makeTable();

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data );
void textEnteredDoSomething( GtkWidget* widget, 
                             GdkEvent* event, gpointer data );
char* word = NULL;           // for the keyword
GtkWidget* textarea;         // for incorporation in textPanel
GtkWidget* canvas;           // for incorporation in drawPanel
GnomeCanvasGroup* rootGroup; // for canvas 
GnomeCanvasItem* item;       // for canvas 

int main( int argc, char* argv[] )
{
    GtkWidget* window;
    GtkWidget* table;
    gnome_init( "aspect", "1.0", argc, argv );
    srand( (unsigned) time( NULL ) );
    window = gtk_window_new( GTK_WINDOW_TOPLEVEL );
    gtk_window_set_default_size( GTK_WINDOW( window ), 300, 200 );
    gtk_signal_connect( GTK_OBJECT( window ),
                        "destroy",
                        GTK_SIGNAL_FUNC( eventDestroy ),
                        NULL );
    table = makeTable();                                          //(A)
    gtk_container_add( GTK_CONTAINER( window ), table );
    gtk_widget_show_all( window );
    gtk_main();
    exit( 0 );
}

GtkWidget* makeTable() {
    GtkWidget* table = gtk_table_new( 1, 2, TRUE );               //(B)
    GtkWidget* textPanel;                                         //(C)
    GtkWidget* drawPanel;                                         //(D)


    // textPanel:
    textPanel = gtk_scrolled_window_new( NULL, NULL );            //(E)
    textarea = gtk_text_new( NULL, NULL );                        //(F)
    gtk_text_set_line_wrap( (GtkText*) textarea, FALSE );         //(G)
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(textPanel),//(H)
                                   GTK_POLICY_AUTOMATIC,
                                   GTK_POLICY_AUTOMATIC);
    gtk_scrolled_window_add_with_viewport(                        //(I)
                 GTK_SCROLLED_WINDOW( textPanel ), textarea );
    gtk_text_set_editable( (GtkText*) textarea, TRUE );           //(J)
    gtk_table_attach_defaults(                                    //(K)
                    GTK_TABLE( table ), textPanel, 0, 1, 0, 1 );
    gtk_widget_show( textPanel );
    gtk_signal_connect( GTK_OBJECT( textarea ),                   //(L)
                        "changed",
                        GTK_SIGNAL_FUNC( textEnteredDoSomething ),
                        NULL );

    // drawPanel:
    drawPanel = gtk_scrolled_window_new( NULL, NULL );            //(M)
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(drawPanel),//(N)
                                   GTK_POLICY_NEVER,
                                   GTK_POLICY_NEVER);
    canvas = gnome_canvas_new();                                  //(O)
    gtk_widget_set_usize( canvas, 100, 100 );                     //(P)
    rootGroup = gnome_canvas_root( GNOME_CANVAS( canvas ) );      //(Q)
    gtk_container_add( GTK_CONTAINER( drawPanel ), canvas );      //(R)
    gtk_table_attach_defaults( GTK_TABLE( table ), 
                                    drawPanel, 1, 2, 0, 1 );
    return table;
}

gint eventDestroy( GtkWidget* widget, 
                      GdkEvent* event, gpointer data ) {
    gtk_main_quit();
    return 0;
}


void textEnteredDoSomething( GtkWidget* widget,                   //(S)
                             GdkEvent* event, 
                             gpointer data ) {
    double xpos;
    double ypos;
    gint end_pos = gtk_editable_get_position( 
                                    (GtkEditable*) widget );      //(T)
    gchar* str = gtk_editable_get_chars( (GtkEditable*) widget,   //(U)
                                             end_pos - 1,
                                             end_pos );
    if ( word == NULL) {
        word = malloc( 50 );  
        *word = '\0';
    }
    if (strlen (word) >= 50) { //guard against buffer breaking 50 chars 
        free (word);
        word = malloc ( 50 );
        *word = '\0';
    }
    if ( str != NULL ) {
        if ( *str == ' ' || *str == '\n') {
            if ( strcmp( word, "red" ) == 0 ) {
                xpos = rand() %75;
                ypos = rand() %75;
                item = gnome_canvas_item_new( rootGroup,          //(V)
                                  gnome_canvas_rect_get_type(),
                                  "x1", xpos,
                                  "y1", ypos,
                                  "x2", xpos + 20.0 ,
                                  "y2", ypos + 20.0 ,
                                  "fill_color", "red",
                                  "outline_color", "white",
                                  NULL );
                gnome_canvas_item_show( item );
            }
            if ( strcmp( word, "green" ) == 0 ) {
                xpos = rand() %75;
                ypos = rand() %75;
                item = gnome_canvas_item_new( rootGroup,
                                  gnome_canvas_rect_get_type(),
                                  "x1", xpos,
                                  "y1", ypos,
                                  "x2", xpos + 20.0 ,
                                  "y2", ypos + 20.0 ,
                                  "fill_color", "green",
                                  "outline_color", "white",
                                  NULL );
                gnome_canvas_item_show( item );
            }
            if ( strcmp( word, "blue" ) == 0 ) {
                xpos = rand() %75;
                ypos = rand() %75;
                item = gnome_canvas_item_new( rootGroup,
                                  gnome_canvas_rect_get_type(),
                                  "x1", xpos,
                                  "y1", ypos,
                                  "x2", xpos + 20.0 ,
                                  "y2", ypos + 20.0 ,
                                  "fill_color", "blue",
                                  "outline_color", "white",
                                  NULL );
                gnome_canvas_item_show( item );
            }
            if ( strcmp( word, "magenta" ) == 0 ) {
                xpos = rand() %75;
                ypos = rand() %75;
                item = gnome_canvas_item_new( rootGroup,
                                  gnome_canvas_rect_get_type(),
                                  "x1", xpos,
                                  "y1", ypos,
                                  "x2", xpos + 20.0 ,
                                  "y2", ypos + 20.0 ,
                                  "fill_color", "magenta",
                                  "outline_color", "white",
                                  NULL );
                gnome_canvas_item_show( item );
            }
            free (word);
            word = NULL;
            gnome_canvas_update_now( (GnomeCanvas*) canvas );
        }
        else strcat( word, str );
    }
    g_free( str );
}
