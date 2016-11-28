#!/usr/bin/perl -w

###  SharedData.pl

use strict;
use threads;                                                        #(A)
use threads::shared;                                                #(B)

my $p = 5;                                                          #(C)
my $q:shared = 5;                                                 #(D)

threads->create( sub { print ++$p, "  ",  ++$q, "\n" } )->join;     #(E)
       
                              # output:   6  6                      #(F)

print "$p  $q\n";             # output:   5  6                      #(G)
