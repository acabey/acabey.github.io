#!/usr/bin/perl -w                                                  

## DefaultWithOr.pl

use strict;                                                         

die "Too many command line args\n" unless @ARGV <= 5;              #(A)

my $sum;                                                              

foreach ( 1..5 ) {                                                 #(B)
    my $entry = shift @ARGV || -10;                                #(C)
    $sum += $entry;                                                #(D)
}

my $avg = $sum / 5.0;                                              #(E)

print "The average over five entries is $avg\n";
