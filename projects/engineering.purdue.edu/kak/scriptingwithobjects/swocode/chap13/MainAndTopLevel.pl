#!/usr/bin/perl -w
use strict;

###  MainAndTopLevel.pl

use Tk;

my $mw = MainWindow->new( -title => "First Window" );                #(A)
$mw->geometry( "200x150+50+100" );                                   #(B)

my $top = $mw->Toplevel( -title => "Second Window" );                #(C)
$top->geometry( "200x150+300+150" );                                 #(D)

$mw->Button(                                                         #(E)
             text => 'Click Here',                                   #(F)
             command => sub {print "Hello From First Window\n";}     #(G)
           )->pack();                                                #(H)

$top->Button(                                                        #(I)
              text => 'Click Here Also',                             #(J)
              command => sub {print "Hello From Second Window\n";}   #(K)
            )->pack();                                               #(L)

MainLoop();                                                          #(M)
