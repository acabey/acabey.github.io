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



//RenderGraphics.c 

#include <gnome.h>
#include "allthatjazz.xpm"

gint eventDestroy( GtkWidget* widget, GdkEvent* event, gpointer data );
GnomeCanvasPoints* makePolygon( gint h, gint v );

#define HORIZ 100
#define VERT 50
#define WIDTH 550
#define HEIGHT 400

double affine[6];

int main( int argc, char* argv[] )
{
    GtkWidget* app;
    GtkWidget* canvas;
    GnomeCanvasGroup* rootGroup;
    GnomeCanvasItem* item;
    GdkImlibImage* image;

    gnome_init( "Graphics Demo", "1.0", argc, argv );
    app = gnome_app_new( "canvasorder", "Gnome Canvas Order" );
    gtk_signal_connect( GTK_OBJECT( app ),
                        "destroy",
                        GTK_SIGNAL_FUNC( eventDestroy ),
                        NULL );

    canvas = gnome_canvas_new();
    gtk_widget_set_usize( canvas, WIDTH, HEIGHT );
    gnome_canvas_set_scroll_region( GNOME_CANVAS( canvas ), 
                                    0.0,
                                    0.0,
                                    WIDTH,
                                    HEIGHT );
    rootGroup = gnome_canvas_root( GNOME_CANVAS( canvas ) );
    gnome_app_set_contents( GNOME_APP( app ), canvas );

    item = gnome_canvas_item_new( rootGroup,                     //(H1)
                                  gnome_canvas_rect_get_type(),  //(H2)
                                  "x1", (double) ( 20 ),         //(H3)
                                  "y1", (double) ( 20 ),         //(H4)
                                  "x2", (double) ( 20 + HORIZ ), //(H5)
                                  "y2", (double) ( 20 + VERT ),  //(H6)
                                  "fill_color", "red",           //(H7)
                                  "outline_color", "black",      //(H8)
                                  NULL );                        //(H9)
    item = gnome_canvas_item_new( rootGroup,                     //(I1)
                                 gnome_canvas_ellipse_get_type(),//(I2)
                                  "x1", (double) ( 220 ),        //(I3)
                                  "y1", (double) ( 20 ),         //(I4)  
                                  "x2", (double) ( 220 + HORIZ ),//(I5)
                                  "y2", (double) ( 20 + VERT ),  //(I6)
                                  "fill_color", "blue",          //(I7)
                                  "outline_color", "black",      //(I8)
                                  NULL );                        //(I9)
    item = gnome_canvas_item_new( rootGroup,                      //(J)
                                  gnome_canvas_rect_get_type(),
                                  "x1", (double) 400,
                                  "y1", (double) 20,
                                  "x2", (double) 400 + HORIZ,
                                  "y2", (double) 20 + VERT,
                                  "outline_color", "white",
                                  NULL );
    item = gnome_canvas_item_new( rootGroup,                     //(K1)
                                  gnome_canvas_text_get_type(),  //(K2)
                                  "text", "The hungry brown fox" //(K3)
                                  " jumped over a lazy dog.",    //(K4)
                                  "font", "12x24",               //(K5)
                                  "x", (double) 20,              //(K6)
                                  "y", (double) 100,             //(K7)
                                  "fill_color", "magenta",       //(K8)
                                  "anchor", GTK_ANCHOR_W,        //(K9)
                                  NULL );                       //(K10)
    image = gdk_imlib_create_image_from_xpm_data( allthatjazz );  //(L)
    item = gnome_canvas_item_new( rootGroup,                     //(M1)
                                  gnome_canvas_image_get_type(), //(M2)
                                  "image", image,                //(M3)
                                  "x", (double) 20,              //(M4)
                                  "y", (double) 250,             //(M5)
                                  "width", (double) 200,         //(M6)
                                  "height", (double) 200,        //(M7)
                                  "anchor", GTK_ANCHOR_W,        //(M8)
                                  NULL );                        //(M9)
    item = gnome_canvas_item_new( rootGroup,                     //(N1)
                                 gnome_canvas_polygon_get_type(),//(N2)
                                 "points", makePolygon( 50, 50 ),//(N3)
                                 "fill_color", "red",            //(N4)
                                 "outline_color", "black",       //(N5)
                                 NULL );                         //(N6)
    art_affine_rotate( affine, 45.0 );                            //(O)
    gnome_canvas_item_affine_relative( item, affine );            //(P)
    art_affine_translate( affine, 400, 250 );                     //(Q)
    gnome_canvas_item_affine_relative( item, affine );            //(R)

    gtk_widget_show_all( app );
    gtk_main();
    gdk_imlib_destroy_image( image );
    exit( 0 );
}

gint eventDestroy(GtkWidget* widget, GdkEvent* event, gpointer data) {     
    gtk_main_quit();     
    return 0; 
}        

GnomeCanvasPoints* makePolygon( gint h, gint v ) {               //(S)
    int i;
    GnomeCanvasPoints* points;
    static const gint xy[ 10 ] = {-1,-1, 1,-1,1,1,-1,1,-1,-1};
    points = gnome_canvas_points_new( 5 );
    for ( i=0; i < 10; i += 2 ) {
        points->coords[i] = ( xy[i] * h );
        points->coords[i + 1] = ( xy[i + 1] * v );
    }
    return points;
}
