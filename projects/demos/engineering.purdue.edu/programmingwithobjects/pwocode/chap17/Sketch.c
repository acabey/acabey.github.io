// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 17  OO For Graphical User Interfaces, A Tour Of Three Toolkits
//
// Section:     Section 17.21  Drawing Shapes,Text,And Images In GNOME/GTK+
//



//Sketch.c

#include <gnome.h>

#define WIDTH 400
#define HEIGHT 300

int pointIndex = 0;
GnomeCanvasPoints* points;
GtkWidget *canvas;
GnomeCanvasGroup* rootGroup;
GnomeCanvasItem* item;

gint eventDestroy(GtkWidget *widget, GdkEvent *event,gpointer data);
gboolean canvasEvent(GtkWidget *widget, GdkEventButton* event );
GnomeCanvasPoints* makePolyline();

int main(int argc,char *argv[])
{
    GtkWidget *app;
    gnome_init("Sketch","1.0",argc,argv);
    app = gnome_app_new("sketch", "Make a free-form sketch");

    gtk_signal_connect(GTK_OBJECT(app),"destroy",
                             GTK_SIGNAL_FUNC(eventDestroy),NULL);
    points = gnome_canvas_points_new( 1000 );
    canvas = gnome_canvas_new();
    gtk_widget_set_usize(canvas,WIDTH,HEIGHT);
    gnome_canvas_set_scroll_region( GNOME_CANVAS( canvas ), 
                                    0.0,
                                    0.0,
                                    WIDTH,
                                    HEIGHT );
    rootGroup = gnome_canvas_root( GNOME_CANVAS( canvas ) );
    gnome_app_set_contents( GNOME_APP(app), canvas);
    gtk_signal_connect( GTK_OBJECT(canvas), "event",              //(T)
                        GTK_SIGNAL_FUNC( canvasEvent ), NULL );
    gtk_widget_show_all(app);
    gtk_main();
    exit(0);
}

gboolean canvasEvent(GtkWidget* widget, GdkEventButton* eventButton) {
    gint xpoint;
    gint ypoint;

    switch( eventButton->type ) {                                 //(U)
        case GDK_BUTTON_PRESS:
            if ( eventButton->button == 1 ) {                    //(V1)
                xpoint = eventButton->x;                         //(V2)
                ypoint = eventButton->y;                         //(V3)
                points->coords[ pointIndex ] = xpoint;           //(V4)
                points->coords[ pointIndex + 1] = ypoint;        //(V5)
                pointIndex += 2;
            }
            break;
        case GDK_2BUTTON_PRESS:
            if ( eventButton->button == 1 ) {
                item = gnome_canvas_item_new( rootGroup,
                                gnome_canvas_line_get_type(),     //(W)
                                "points", makePolyline(),
                                "fill_color", "red",
                                "width_pixels", 4,
                                NULL );
            }
            break;
        case GDK_3BUTTON_PRESS:
            if ( eventButton->button == 2 ) {
                gnome_canvas_points_free( points );
                exit(0);
            }
            break;
        default:
            break;
    }
        return(TRUE);
}

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data){
    gtk_main_quit();
    gnome_canvas_points_free( points );
    return(0);
}             

GnomeCanvasPoints* makePolyline() {                               //(X)
    int i;
    int N = pointIndex/2 - 1;
    GnomeCanvasPoints* newPoints = gnome_canvas_points_new( N );
    for ( i = 0; i < pointIndex - 2; i++ ) 
        newPoints->coords[ i ] = points->coords[ i ];
    return newPoints;
}
