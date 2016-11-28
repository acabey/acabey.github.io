#!/usr/bin/perl -w

### Slurp.pl

use strict;

open FILEOUT, ">data_out.txt"                                      #(A)
        or die "unable to open filename: $!";                      #(B)

if (@ARGV) {                                                       #(C)
    my @all_of_it = <>;                                            #(D)
    print @all_of_it;                                              #(E)
    print FILEOUT @all_of_it;                                      #(F)
} else {                                                           #(G)
    open FILEIN, "data1.txt";                                      #(H)
        or die "unable to open filename: $!";                      #(I)
    my @all_of_it = <FILEIN>;                                      #(J)
    print @all_of_it;                                              #(K)
    print FILEOUT @all_of_it;                                      #(L)
}
