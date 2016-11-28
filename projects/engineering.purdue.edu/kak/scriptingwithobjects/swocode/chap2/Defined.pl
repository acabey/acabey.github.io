#!/usr/bin/perl -w                                                   

## Defined.pl

use strict;                                                          

print "Enter numbers, one per line. " .
         "Enter Cntl-d to indicate the end of data entry.\n";      #(A)
my $sum;                                                           #(B)

while ( defined( my $entry = <> ) ) {                              #(C)
    $sum += $entry;                                                #(D)
}

print "Sum = $sum\n";                                              #(E)
