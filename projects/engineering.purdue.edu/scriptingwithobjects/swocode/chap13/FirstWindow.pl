#!/usr/bin/perl -w

###  FirstWindow.pl

use strict;                                                 
use Tk;                                                              #(A)

my $mw = MainWindow->new();                                          #(B)
$mw->title( "My First Window" );                                     #(C)
$mw->geometry( "200x150+50+100" );                                   #(D)
$mw->maxsize( 400, 500 );                                            #(E)
$mw->minsize( 100, 200 );                                            #(F)

my $label = $mw->Label( -text    =>    'hello',                      #(G)
                        -anchor  =>    's',                          #(H)
                        -relief  =>    'groove',                     #(I)
                        -width   =>    10,                           #(J)
                        -height  =>    3,                            #(K)
                      );
$label->pack( -side => 'top',                                        #(L)
              -padx => 10,                                           #(M)
              -pady => 5 );                                          #(N)

MainLoop();                                                          #(O)
