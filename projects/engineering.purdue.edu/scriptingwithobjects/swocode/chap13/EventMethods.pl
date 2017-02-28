#!/usr/bin/perl -w

### EventMethods.pl

use strict;
use Tk;

my $mw = MainWindow->new( -title => "Testing Callback" );            #(A)
my $b = $mw->Button( -text => "click here" )->pack( -side => 'top' );#(B)
my $c = $mw->Canvas()->pack( -side => 'bottom' );                    #(C)

$mw->bind( '<KeyPress>' => \&testEventMethods );                     #(D)
$b->bind( '<Button>' => \&testEventMethods );                        #(E)
$c->CanvasBind( '<Button>' => \&testEventMethods );                  #(F)

sub testEventMethods {                                               #(G)
    my $e = $Tk::event;                                              #(H)
    print "\n\nEvent object: $e\n";                                  #(I)
    print "Source widget: ", $e->W, "\n";                            #(J)
    print "Event object: ", $e->W->XEvent, "\n";                     #(K)
    print "Key (ASCII only): ", ($e->A ? $e->A : ''), "\n";          #(L)
    print "Key (any): ", ($e->K ? $e->K : ''), "\n";                 #(M)
    print "(x,y) coord relative to laptop screen: ", 
                                   $e->X, ", ", $e->Y, "\n";         #(N)
    print "(x,y) coord relative to widget: ", 
                                   $e->x, ", ", $e->y, "\n";         #(O)
}
MainLoop;                                                            #(P)
