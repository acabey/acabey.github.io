#!/usr/bin/perl -w                                                 

## WhileIf.pl

use strict;                                                        

print "Enter numbers, one per line. When done, just enter return\n";#(A)

my $sum;                                                            #(B)

while (<>) {                                                        #(C)
    if (/^\s*$/) {                                                  #(D)
        printf "Sum of numbers is: %d\n", $sum;                     #(E)
        last;                                                       #(F)
    }                                                               #(G)
    $sum += $_;                                                     #(H)
}
