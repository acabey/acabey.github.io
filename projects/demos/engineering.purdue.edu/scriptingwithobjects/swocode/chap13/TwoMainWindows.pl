#!/usr/bin/perl -w
use strict;

###  TwoMainWindows.pl

use Tk;

my $mw1 = MainWindow->new( -title => "First Window" );               #(A)
$mw1->geometry( "200x150+50+100" );                                  #(B)

my $mw2 = MainWindow->new( -title => "Second Window" );              #(C)
$mw2->geometry( "200x150+300+150" );                                 #(D)

$mw1->Button(                                                        #(E)
              text => 'Click Here',                                  #(F)
              command => sub {print "Hello From First Window\n";}    #(G)
            )->pack();                                               #(H)

$mw2->Button(                                                        #(I)
              text => 'Click Here Also',                             #(J)
              command => sub {print "Hello From Second Window\n";}   #(K)
            )->pack();                                               #(L)

MainLoop();                                                          #(M)
