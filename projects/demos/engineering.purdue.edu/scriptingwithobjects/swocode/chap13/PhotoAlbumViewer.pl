#!/usr/bin/perl -w

###  PhotoAlbumViewer.pl

use strict;
use Tk;

# Constants, flags, alarm handler
my $slide_show_time_interval = 3;   # in seconds                    #(A1)
my $user_destroyed_image_window = 0;                                #(A2)
my $slideshow_timer_flag;                                           #(A3)
my $slideshow_on_off_flag = 1;                                      #(A4)
my $slide_index;                                                    #(A5)
$SIG{ALRM} = \&alarm_handler;                                       #(A6)

# Set up the GUI and its menubar at the top:
my $mw = MainWindow->new( -title => "Album Viewer" );               #(B1)
$mw->geometry( "80x50+0+0" );                                       #(B2)
my $top;                                                            #(B3)
my $menubar = $mw->Menu;                                            #(B4)
$mw->configure( -menu =>  $menubar );                               #(B5)
my $file_menu = $menubar->cascade( -label => 'Photos' );            #(B6)
my $format_conversion_menu = $mw->Menu;                             #(B7) 
$menubar->cascade( -label => 'Convert',                             #(B8)
                   -menu => $format_conversion_menu );              #(B9)
my $slideshow_menu = $menubar->cascade( -label => 'Slideshow' );   #(B10)
my $misc_menu = $menubar->cascade( -label => 'Misc' );             #(B11)

# The text area of the GUI for displaying the status reports:
my $textWindow = $mw->Scrolled( 'Text',                            #(B12)
                              -scrollbars => 'ow',                 #(B13)
                              -setgrid => 'true',                  #(B14)
                           )->pack( -side => 'bottom',             #(B15)
                                    -expand => 1,                  #(B16)
                                    -fill => 'both'                #(B17)
                                  );                      
# Set up the menus for the menubar:
my @gif_files = glob "*.gif";                                      #(B18)
$textWindow->insert( 'end', "All gif files: @gif_files\n");        #(B19)
# Register 'display_image' callback with the buttons
# of the 'Photo' menu:
foreach my $i (0 .. $#gif_files) {                                 #(B20)
    my $menu_item =                                                #(B21)
       $file_menu->command( -label =>  "$gif_files[$i]",           #(B22)
             -command => [\&display_image, $gif_files[$i] ] );     #(B23)
    $menu_item->configure( -columnbreak => 1 ) unless $i % 30;     #(B24)
}

# Get all JPEG files for which there are no current
# GIF versions for the 'Convert' menu:
my @jpeg_files = glob "*.jpg";                                     #(B25)
my %gif_files = map { $_ => 1 } @gif_files;                        #(B26)
my @unique_jpegs =                                                 #(B27)
    grep { ! exists_jpeg_in_gifs( $_, %gif_files ) } @jpeg_files;  #(B28)
# For each not yet converted JPEG image, register the 
# 'image_convert' callback with each button of the 'Convert' menu:
if ($#unique_jpegs >= 0) {                                         #(B29)
    foreach my $i (0 .. $#unique_jpegs) {                          #(B30)
        $format_conversion_menu->command(                          #(B31)
                 -label => "convert $unique_jpegs[$i] to gif",     #(B32)
                 -command => [\&image_convert, $unique_jpegs[$i] ] #(B33)
        );
    }
}
# Two items for the Slideshow menu:
$slideshow_menu->command( -label => "Start Slideshow",             #(B34)
                          -command => \&start_slideshow );         #(B35)
$slideshow_menu->command( -label => "Stop Slideshow",              #(B36)
                          -command => \&stop_slideshow );          #(B37)
# Items for the Misc menu:
$misc_menu->command( -label => "Show all gifs",                    #(B38)
             -command => sub { system "display \'vid:\*.gif\'" } );#(B39)
$misc_menu->command( -label => "Show all jpegs",                   #(B40)
             -command => sub { system "display \'vid:\*.jpg\'" } );#(B41)
$misc_menu->command( -label => "Convert All JPEGs to GIFs",        #(B42)
             -command => \&convert_all_jpegs );                    #(B43)


# Setup for the slideshow controller window:
my $controller = $mw->Toplevel( -title => "Slideshow Controller" ); #(C1)
$controller->geometry( "+0-40" );                                   #(C2)
$controller->Label( -text =>  "Time in Seconds Between Slides" )
           ->pack( -side => 'top' );                                #(C3)
$controller->Scale(  -length => 300,                                #(C4)
                    -sliderlength => 20,                            #(C5)
                    -variable => \$slide_show_time_interval,        #(C6)
                    -from => 1,                                     #(C7)
                    -to => 10,                                      #(C8)
                    -orient => 'horizontal'                         #(C9)
                  )->pack();                                       #(C10)
my $frame = $controller->Frame->pack();                            #(C11)
$frame->Button( -text => "Start",                                  #(C12)
                -command => \&start_slideshow,                     #(C13)
              )->pack( -side => 'left' );                          #(C14)
$frame->Button( -text => "Clear Display",                          #(C15)
                -command => 
                    sub { $textWindow->delete( '1.0', 'end') },    #(C16)
              )->pack( -side => 'right' );                         #(C17)
$frame->Button( -text => "Exit",                                   #(C18)
                -command => sub { exit },                          #(C19)
              )->pack( -side => 'right' );                         #(C20)
$frame->Button( -text => "Stop",                                   #(C21)
                -command => \&stop_slideshow,                      #(C22)
              )->pack( -side => 'right' );                         #(C23)
$frame->Button( -text => "Resume",                                 #(C24)
                -command => \&restart_slideshow,                   #(C25)
              )->pack( -side => 'right' );                         #(C26)
$frame->Button( -text => "Skip Back and Pause",                    #(C27)
                -command => \&skip_back_and_pause,                 #(C28)
              )->pack( -side => 'right' );                         #(C29)
$frame->Button( -text => "Pause",                                  #(C30)
                -command => \&pause_slideshow,                     #(C31)
              )->pack( -side => 'right');                          #(C32)

$controller->raise( $mw );                                         #(C33)
$frame->focus;                                                     #(C34)

MainLoop;                                                          #(C35)

#------------------------- The Callbacks ----------------------------

# The following callback is registered with the buttons 
# of the 'File' menu.  This subroutine is also called by 
# the 'slideshow()' callback, and the 'skip_back_and_pause()'
# callback:
sub display_image {                                                 #(D1)
    if (defined $top and $user_destroyed_image_window == 0) {       #(D2)
        $top->destroy;                                              #(D3)
    }
    $user_destroyed_image_window = 0 
                    if $user_destroyed_image_window;                #(D4)
    my $image_scaled_predicate = 0;                                 #(D5)
    my $filename = shift;                                           #(D6)
    if (!$filename) {                                               #(D7)
        $textWindow->insert( 'end', 
                     "display_image called without filename\n" );   #(D8)
        return;                                                     #(D9)
    }
    $textWindow->insert( 'end', "\nDisplaying $filename\n" );      #(D10)

    # Construct a Photo object for the image:
    my $photo = $mw->Photo('image', -height => 0, -width => 0 );   #(D11)
    $photo->read( $filename );                                     #(D12)
    my ($image_width, $image_height) = 
                    ( $photo->width, $photo->height );             #(D13)
    $textWindow->insert( 'end', 
      "image width: $image_width  image height: $image_height\n" );#(D14)

    my ($screen_width, $screen_height) =                           
        `xdpyinfo | grep dimensions` =~ /(\d+)x(\d+)/;             #(D15)
    my $newphoto = 
            $mw->Photo('newimage', -height => 0, -width => 0 );    #(D16)
    if ( $image_width > $screen_width 
                  or $image_height > $screen_height ) {            #(D17)
        $image_scaled_predicate = 1;                               #(D18)
        my $x = int($image_width / $screen_width + 1);             #(D19)
        my $y = int($image_height / $screen_height + 1);           #(D20)
        if ( $x > $y ) {                                           #(D21)
            $newphoto->copy( $photo, -subsample => $x );           #(D22)
        } else {                                                   #(D23)
            $newphoto->copy( $photo, -subsample => $y );           #(D24)
        }
    }

    # Construct a new window for displaying the image:
    $top = $mw->Toplevel;                                          #(D25)
    $top->geometry("-0+0");                                        #(D26)
    my $canvas = $top->Canvas()->pack( -side => 'top' );           #(D27)

    if (  $image_scaled_predicate ) {                              #(D28)
        my $label = $canvas->Label(-image=>$newphoto,-anchor=>'nw')#(D29)
                           ->pack( -side => 'top');                #(D30)
    } else {                                                       #(D31)
        my $label = $canvas->Label(-image=>$photo,-anchor=>'nw')   #(D32)
                           ->pack( -side => 'top');                #(D33)
    }
    $canvas->CanvasBind( '<Destroy>', 
                        sub { $user_destroyed_image_window = 1 }); #(D34)
    $canvas->update;                                               #(D35)
}


# Used as a callback for the items of the 'Convert' menu:
sub image_convert {                                                 #(E1)
    my $filename = shift;                                           #(E2)
    my $gif_filename = $filename;                                   #(E3)
    $gif_filename =~ s/\.jpg$/\.gif/;                               #(E4)
    $textWindow->insert('end', "\n\nConverting $filename to gif\n");#(E5)
    system "convert $filename $gif_filename";                       #(E6)
    $file_menu->command( -label =>  "$gif_filename",                #(E7)
                   -command => [\&display_image, $gif_filename ] ); #(E8)
    $format_conversion_menu->delete( "convert $filename to gif" );  #(E9)
    my $i = 0;                                                     #(E10)
    # find index of converted jpeg in @unique_jpegs
    my @where = map {$i++; ($_ =~ /$filename/) ? $i : undef} 
                                                   @unique_jpegs;  #(E11)
    @where = grep {defined $_} @where;                             #(E12)
    my $where = $where[0] - 1;                                     #(E13)
    splice @unique_jpegs, $where, 1;                               #(E14)
    $textWindow->insert('end', 
              "\n\nFinished converting $filename to gif\n");       #(E15)
}


# This callback registered with the "Convert All JPEGs to GIFs" 
# button of the 'Misc' menu:
sub convert_all_jpegs {                                             #(F1)
    $textWindow->insert('end', "\nConverting all jpegs to gifs\n"); #(F2)
    if ( $#unique_jpegs >= 0 ) {                                    #(F3)
        foreach my $i (0 .. $#unique_jpegs) {                       #(F4)
            $textWindow->insert( 'end',                             
                "Converting  $unique_jpegs[$i] to GIF format\n");   #(F5)
            my ($now) = (localtime =~ /(..:..:..)/);
            $textWindow->insert( 'end',
                                 "  at time $now\n\n" );
            my $gif_filename = $unique_jpegs[$i];                   #(F6)
            $gif_filename =~ s/\.jpg$/\.gif/;                       #(F7)
            system "convert $unique_jpegs[$i] $gif_filename";       #(F8)
            $file_menu->command( -label =>  "$gif_filename",        #(F9)
                   -command => [\&display_image, $gif_filename ]); #(F10)
            $format_conversion_menu->delete( 
                             "convert $unique_jpegs[$i] to gif" ); #(F11)
        }
        @unique_jpegs = ();                                        #(F12)
        $textWindow->insert('end', 
                       "Finished converting all jpegs to gifs\n"); #(F13)
    } else {                                                       #(F14)
        $textWindow->insert('end', "\nNo jpegs left to convert\n");#(F15)
    }
}


# This callback is registered with the "Pause" button of the
# slideshow controller window:
sub pause_slideshow {                                               #(G1)
    $slideshow_on_off_flag = 0;                                     #(G2)
    $textWindow->insert( 'end', "\n\nSLIDESHOW PAUSED\n\n" );       #(G3)
}


# This callback is registered with the "Skip Back and Pause" 
# button of the slideshow controller window:
sub skip_back_and_pause {                                           #(H1)
    return if $slide_index == 0;                                    #(H2)
    $slideshow_on_off_flag = 0;                                     #(H3)
    my @slide_files = glob "*.gif";                                 #(H4)
    $slide_index = $slide_index - 2;                                #(H5)
    $textWindow->insert( 'end',                                     
           "\n\nDisplay previous: $slide_files[$slide_index]\n" );  #(H6)
    display_image( $slide_files[$slide_index] );                    #(H7)
    $textWindow->insert( 'end', "\n\nSLIDESHOW PAUSED\n\n" );       #(H8)
}


# This callback registered with the "Start Slideshow" button
# of the 'Slideshow' menu and the "Start" button of the 
# slideshow controller window:
sub start_slideshow {                                               #(I1)
    $textWindow->insert( 'end', "\n\nSTARTING SLIDESHOW\n\n" );     #(I2)
    $slideshow_on_off_flag = 1;                                     #(I2)
    $slide_index = 0;                                               #(I4)
    slideshow();                                                    #(I5)
}


# This callback is registered with the "Resume" button of
# the slideshow controller window:
sub restart_slideshow {                                             #(J1)
    $textWindow->insert( 'end', "\n\nRESTARTING SLIDESHOW\n\n" );   #(J2)
    $slideshow_on_off_flag = 1;                                     #(J3)
    slideshow();                                                    #(J4)
}


# This subroutine is called by the start_slideshow() and the
# restart_slideshow() callbacks:
sub slideshow {                                                     #(K1)
    my @slide_files = glob "*.gif";                                 #(K2)
    foreach my $i ($slide_index .. $#slide_files) {                 #(K3)
        return if $slideshow_on_off_flag == 0;                      #(K4)
        $slideshow_timer_flag = 0;                                  #(K5)
        display_image( $slide_files[$i] );                          #(K6)
        $slide_index++;                                             #(K7)
        alarm( $slide_show_time_interval );                         #(K8)
        while (1) { last if $slideshow_timer_flag; }                #(K9)
    }
    $textWindow->insert( 'end', "\n\nSLIDESHOW FINISHED\n" );      #(K10)
}


# This callback registered with the "Stop Slideshow" button
# of the 'Slideshow' menu and the "Stop" button of the
# slideshow controller window:
sub stop_slideshow {                                                #(L1)
    $textWindow->insert( 'end', "\n\nSTOPPING SLIDESHOW\n" );       #(L2)
    $slideshow_on_off_flag = 0;                                     #(L3)
}


# Used in line (A32) as a predicate for checking if a GIF
# version of a JPEG file is available:
sub exists_jpeg_in_gifs {                                           #(M1)
    my $jpeg_file = shift;                                          #(M2)
    my %gif_set = @_;                                               #(M3)
    $jpeg_file =~ s/\.jpg//;                                        #(M4)
    my %gif_stems = map {s/\.gif//;$_} %gif_set;                    #(M5)
    return 1 if exists $gif_stems{$jpeg_file};                      #(M6)
    return 0;                                                       #(M7)
}


# For the alarm handler defined in line (A5):
sub alarm_handler {                                                 #(N1)
    my ($now) = (localtime =~ /(..:..:..)/);                        #(N2)
    $textWindow->insert('end', "\nalarm handler invoked at $now\n");#(N3)
    $slideshow_timer_flag = 1;                                      #(N4)
}
