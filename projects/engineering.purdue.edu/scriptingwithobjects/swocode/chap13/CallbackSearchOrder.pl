#!/usr/bin/perl -w

### CallbackSearchOrder.pl

use strict;
use Tk;

my $mw = MainWindow->new();                                          #(A)
my $b = $mw->Button()->pack();                                       #(B)

sub foo_tops { print "callback for Toplevel instance invoked\n" }    #(C)
$mw->bind( '<Button>', \&foo_tops);                                  #(D)

sub foo_Butt { print "callback for Button class invoked\n" }         #(E)
$b->bind( 'Tk::Button', '<Button-1>', \&foo_Butt );                  #(F)

sub foo_butt { 
    my $tag = shift;
    print "callback for Button instance invoked\n";
    $tag->break;
}                                                                    #(G)

$b->bind( '<Button>', \&foo_butt);                                   #(H)

sub foo_App { print "callback for Application level invoked\n" }     #(I)
$b->bind( 'all', '<Button>', \&foo_App);                             #(J)

my @tags = $b->bindtags;
$b->bindtags( [@tags[1, 0, 2, 3]]);

MainLoop;                                                            #(K)
