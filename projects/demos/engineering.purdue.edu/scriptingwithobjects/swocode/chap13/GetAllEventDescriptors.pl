#!/usr/bin/perl -w

### GetAllEventDescriptors.pl

use strict;
use Tk;

my $mw = MainWindow->new();                                          #(A)
my $b = $mw->Button()->pack();                                       #(B)

my %event_descriptors;                                               #(C)

my @tags = $b->bindtags();
print "@tags\n";

foreach my $tag ( $b->bindtags ) {                                   #(D)
    my %events = map { $_ => 1 } $b->bind( $tag );                   #(E)
    %event_descriptors = 
          map { $_ => 1 } keys %event_descriptors, keys %events;     #(F)
}

print join "\n", keys %event_descriptors;                            #(G)
