#!/usr/bin/perl -w

### GetEventDescriptors.pl

use strict;
use Tk;

my $mw = MainWindow->new();                                          #(A)
my $b = $mw->Button();                                               #(B)

print "All system-supplied event descriptors for \
the Button class:\n\n";
print join( "\n", $b->bind( ref $b ) ), "\n\n";                      #(C)    

# Declare additional event descriptors for the Button class:
$b->bind( 'Tk::Button', '<Button-2>', sub { $mw->foo2 } );           #(D)
$b->bind( 'Tk::Button', '<ButtonRelease-2>', sub { $mw->foo2 } );    #(E)

print "All event descriptors defined for Button class \
including the new ones:\n\n";
print join( "\n", $b->bind( ref $b ) ), "\n";                        #(F)    

# Declare event descriptors for a specific button instance:
$b->bind( '<Button-3>', sub { $mw->foo3 } );                         #(G)
$b->bind( '<Button-4>', sub { $mw->foo4 } );                         #(H)
$b->bind( '<Button-5>', sub { $mw->foo5 } );                         #(I)
$b->bind( '<ButtonRelease-3>', sub { $mw->bar3 } );                  #(J)
$b->bind( '<ButtonRelease-4>', sub { $mw->bar4 } );                  #(K)
$b->bind( '<ButtonRelease-5>', sub { $mw->bar5 } );                  #(L)

print "\nAll user-defined event descriptors for \
a specific button:\n\n";
print join( "\n", $b->bind ), "\n";                                  #(M)
