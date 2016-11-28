#!/usr/bin/perl -w
use strict;

### DBM.pl

use DB_File;

dbmopen my %hist, "mydb", 0644                                       #(A)
    or die "Can't create DBM files: $!";                             #(B)
%hist = ();                                                          #(C)

open FILE, "story.txt";                                              #(D)

while (<FILE>) {                                                     #(E)
    chomp;                                                           #(F)
    my @clean_words = map { /([a-z0-9_]+)/i;$1 } split;              #(G)
    map { $hist{ "\L$_" }++ } @clean_words;                          #(H)
}

foreach ( sort keys %hist ) {                                        #(I)
    printf( "%s\t%d\n", $_, $hist{$_} );                             #(J)
}
