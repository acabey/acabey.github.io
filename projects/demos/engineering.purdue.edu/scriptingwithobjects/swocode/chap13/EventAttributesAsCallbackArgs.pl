#!/usr/bin/perl -w

###  EventAttributesAsCallbackArgs.pl

use strict;
use Tk;

my $mw = MainWindow->new();                                          #(A)
my $canvas = $mw->Canvas( -cursor => 'crosshair' )->pack;            #(B)

$canvas->CanvasBind( '<Button>',                                     #(C)
                [ \&getEventProps,                                   #(D)
                  Ev('x'),          # for x-coord of mouse pointer   #(E)
                  Ev('y'),          # for y-coord of mouse pointer   #(F)
                  Ev('b'),          # for button identity            #(G)
                  Ev('t'),          # for the time of the event      #(H)
                  Ev('W')           # for the source widget          #(I)
                ]                                                    #(J) 
         );                                                          #(K)

sub getEventProps {                                                  #(L)
    my $widget = shift;                                              #(M)
    my $x = shift;                                                   #(N)
    my $y = shift;                                                   #(O)
    my $button = shift;                                              #(P)
    my $time = shift;                                                #(Q)
    my $win = shift;                                                 #(R)
    print "widget: $widget\n" .                                      #(S)
          "mouse-pointer position x: $x\n" .                         #(T)
          "mouse-pointer position y: $y\n" .                         #(U)
          "button: $button\n" .                                      #(V)
          "time: $time\n" .                                          #(W)
          "widget: $win\n\n";                                        #(X)
}

MainLoop;
