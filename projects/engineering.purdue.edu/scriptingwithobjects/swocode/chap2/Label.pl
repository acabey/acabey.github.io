#!/usr/bin/perl -w                               

# Label.pl

use strict;                                      

my $word = "blue";                                                 #(A)

FIND_BLUE: while (<>) {                                            #(B)
    foreach (split) {                                              #(C)
        last FIND_BLUE  if /\b$word\b/;                            #(D)
    }
}

print "The word '$word' makes its first appearance" .
                     " in line $. of $ARGV\n";                     #(E)
