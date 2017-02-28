#!/usr/bin/perl -w

### TextFileIO.pl

use strict;

open FILEOUT, ">data_out.txt"                                      #(A)
        or die "unable to open filename: $!";                      #(B)

if (@ARGV) {                                                       #(C)
    while (<>) {                                                   #(D)
        print;                                                     #(E)
        print FILEOUT;                                             #(F)
    } 
} else {                                                           #(G)
    open FILEIN, "data1.txt"                                       #(H)
        or die "unable to open filename: $!";                      #(I)
    while (<FILEIN>) {                                             #(J)
        print;                                                     #(K)
        print FILEOUT;                                             #(L)
    }
}
