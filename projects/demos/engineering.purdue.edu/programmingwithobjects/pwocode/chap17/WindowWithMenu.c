// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.18  Windows With Menus In GNOME/GTK+
//




//WindowWithMenu.c

#include <gnome.h>

GtkWidget* textarea;      
gchar* selected_filename;
GtkWidget* file_selector;

gint eventDestroy( GtkWidget* widget, GdkEvent* event, 
                                             gpointer data );    //(K1)
void allowTextEntry( GtkObject* object, gpointer data );         //(K2)
void selectFileForLoad( GtkObject* object, gpointer data );      //(K3)
void selectFileForSave( GtkObject* object, gpointer data );      //(K4)

int getTextFromFile( GtkFileSelection* selector, gpointer data );//(K5)
int saveTextToFile( GtkFileSelection* selector, gpointer data ); //(K6)

GnomeUIInfo fileMenu[] = {                                        //(L)
    { GNOME_APP_UI_ITEM, "New",
      "Allow text entry into window",
      allowTextEntry, NULL, NULL,                                //(L1)
      GNOME_APP_PIXMAP_NONE,
      NULL, 0, 0, NULL },
    { GNOME_APP_UI_ITEM, "Open",
      "Open an existing file",
      selectFileForLoad, NULL, NULL,                             //(L2)
      GNOME_APP_PIXMAP_NONE,
      NULL, 0, 0, NULL },
    { GNOME_APP_UI_ITEM, "save",
      "save contents to the current file",
      selectFileForSave, NULL, NULL,                             //(L3)
      GNOME_APP_PIXMAP_NONE,
      NULL, 0, 0, NULL },
    GNOMEUIINFO_SEPARATOR,
    { GNOME_APP_UI_ITEM, "Exit",
      "Close the window and cease",
      eventDestroy, NULL, NULL,                                  //(L4)
      GNOME_APP_PIXMAP_NONE,
      NULL, 0, 0, NULL },
    GNOMEUIINFO_END
};

GnomeUIInfo mainMenu[] = {                                        //(M)
    GNOMEUIINFO_SUBTREE( "File", fileMenu ),
    GNOMEUIINFO_END
};
     
int main( int argc, char* argv[] )
{
    GtkWidget* app;
    gnome_init( "aspect", "1.0", argc, argv );
    app = gnome_app_new( "menudemo", "Menu Demo Window" );
    gtk_window_set_default_size( GTK_WINDOW( app ), 300, 200 );
    gtk_signal_connect( GTK_OBJECT( app ),
                        "destroy",
                        GTK_SIGNAL_FUNC( eventDestroy ),
                        NULL );
    textarea = gtk_text_new( NULL, NULL );                       //(N1)
    gtk_text_set_editable( (GtkText*) textarea, FALSE );         //(N2)
    gnome_app_set_contents( GNOME_APP( app ), textarea );        //(N3)
    gnome_app_create_menus( GNOME_APP( app ), mainMenu );        //(N4)
    gtk_widget_show_all( app );
    gtk_main();
    exit( 0 );
}

void allowTextEntry( GtkObject* object, gpointer data ) {         //(O)
    gtk_text_set_editable( (GtkText*) textarea, TRUE );
}    

void selectFileForLoad( GtkObject* object, gpointer data ) {      //(P)
    file_selector = gtk_file_selection_new( "Load Dialog" );
    gtk_signal_connect(                                          //(P1)
        GTK_OBJECT( GTK_FILE_SELECTION( file_selector )->ok_button ),
        "clicked",
        GTK_SIGNAL_FUNC( getTextFromFile ), NULL );
    gtk_signal_connect_object(                                   //(P2)
        GTK_OBJECT( GTK_FILE_SELECTION( file_selector )->ok_button ),
        "clicked",
        GTK_SIGNAL_FUNC( gtk_widget_destroy ),
        (gpointer) file_selector );
    gtk_signal_connect_object(                                   //(P3)
        GTK_OBJECT(GTK_FILE_SELECTION( file_selector )->cancel_button),
        "clicked",
        GTK_SIGNAL_FUNC( gtk_widget_destroy ),
        (gpointer) file_selector );
    gtk_widget_show( file_selector );
}

int getTextFromFile( GtkFileSelection* selector, gpointer data ){ //(Q)
    FILE* fp;
    gint ch;
    gchar* str = g_malloc( 1 + 1 );
    selected_filename = gtk_file_selection_get_filename(         //(Q1)
        GTK_FILE_SELECTION( file_selector ) );
    g_print( "Filename retrieved: %s\n", selected_filename );
    if ( ( fp = fopen( selected_filename, "r" ) ) == NULL ) {    //(Q2)
        g_print( "Unable to open the file" );
        return 1;
    }
    str[ 1 ] = '\0';
    while ( ( ch = getc( fp ) ) != EOF ) {                       //(Q3)
        str[ 0 ] = (gchar) ch;      
        gtk_text_insert( GTK_TEXT( textarea ), 
                                  NULL, NULL, NULL, str, -1 );
    }
    gtk_text_set_editable( (GtkText*) textarea, TRUE );      
    fclose( fp );
    g_free( str );
    return 0;
}

void selectFileForSave( GtkObject* object, gpointer data ) {      //(R)
    file_selector = gtk_file_selection_new( "Save Dialog" );     //(R1)
    gtk_signal_connect(                                          //(R2)
        GTK_OBJECT( GTK_FILE_SELECTION( file_selector )->ok_button ),
        "clicked",
        GTK_SIGNAL_FUNC( saveTextToFile ), NULL );
    gtk_signal_connect_object( 
        GTK_OBJECT( GTK_FILE_SELECTION( file_selector )->ok_button ),
        "clicked",
        GTK_SIGNAL_FUNC( gtk_widget_destroy ),
        (gpointer) file_selector );
    gtk_signal_connect_object( 
        GTK_OBJECT( GTK_FILE_SELECTION(file_selector)->cancel_button ), 
        "clicked",
        GTK_SIGNAL_FUNC( gtk_widget_destroy ),
        (gpointer) file_selector );
    gtk_widget_show( file_selector );
}

int saveTextToFile( GtkFileSelection* selector, gpointer data ) { //(S)
    FILE* fp;
    int len;
    int i = 0;
    gchar* str = gtk_editable_get_chars((GtkEditable*) textarea,0, -1);
    len = strlen( str );
    selected_filename = gtk_file_selection_get_filename(
        GTK_FILE_SELECTION( file_selector ) );
    if ( ( fp = fopen( selected_filename, "w" ) ) == NULL ) {
        g_print( "Unable to open the file for save" );
        return 1;
    }
    while ( i < len ) fputc( str[ i++ ], fp );      
    fclose( fp );
    g_free( str );
    return 0;
}

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data ) {
    gtk_main_quit();
    return 0;
}
