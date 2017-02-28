#!/usr/bin/perl -w

###  PackGeom.pl

use strict;
use Tk;

my $mw = MainWindow->new( -title => "Pack Layout" );                 #(A)
$mw->geometry( "400x200+50+100" );                                   #(B)
$mw->maxsize( 400, 500 );                                            #(C)
$mw->minsize( 100, 200 );                                            #(D)

# Widget for the top side of the main window:

$mw->Button(                                                         #(E)
             -text => 'Click Here for a Greeting',                   #(F)
             -anchor  => 'c',                                        #(G)
             -relief  => 'raised',                                   #(H)
             -command =>  \&print_message,                           #(I)
           )->pack( -side => 'top', -padx => 10, -pady => 5 );       #(J)

sub print_message { print "Good Morning to you!\n"; }                #(K)

# Widget for the bottom side of the main window:

my $entry_var = "Hit <CR> and then enter text here followed by <CR>";#(L)
my $entry_widget = $mw->Entry( -textvariable => \$entry_var,         #(M)
                               -width => 42,                         #(N)
                             )->pack( -side => 'bottom' );           #(O)

$entry_widget->bind( '<Return>' =>                                   #(P)
    sub {                                                            #(Q)
        my $input = $entry_widget->get . "\n";                       #(R)
        $entry_widget->delete( 0, 'end' );                           #(S)
        print "User entered in entry widget: $input\n";              #(T)
    } 
);

# Widget for the left side of the main window:

$mw->Label( -text  => 'hello',                                       #(U)
            -anchor => 'c',                                          #(V)
            -relief => 'groove',                                     #(W)
            -width => 10,                                            #(X)
            -height => 2,                                            #(Y)
          )->pack( -side => 'left', -padx => 10, -pady => 5 );       #(Z)

# Widget for the right side of the main window:         

my $listbox = $mw->Scrolled( "Listbox",                              #(a)
                             -scrollbars => 'w',                     #(b)
                             -selectmode => 'single',                #(c)
                             -width => 10,                           #(d)
                             -height => 3,                           #(e)
                   )->pack( -side => 'right' );                      #(f)
$listbox->insert( 'end', 'red', 'green', 'blue', 'magenta', 'pink' );#(g)
$listbox->bind( '<Button-1>', sub { $listbox->configure(             #(h)
    -background => $listbox->get( $listbox->curselection() ) ) } );  #(i)

MainLoop();                                                          #(j)
