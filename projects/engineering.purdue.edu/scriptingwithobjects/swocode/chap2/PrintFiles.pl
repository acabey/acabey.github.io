#!/usr/bin/perl -w

# PrintFiles.pl

=head1

A Script for Printing Multiple PDF and/or PS Files

=description

Any of the following calls will work

    PrintFiles.pl *.pdf

    PrintFiles.pl *.PDF

    PrintFiles.pl *.ps

=cut


use strict;

die "requires at least one file name" 
    unless @ARGV;                                                   #(A)

foreach (@ARGV) {                                                   #(B)
    die "Only pdf and ps files can be printed out\n"                #(C)
        unless /\.ps|(df)$/i;                                       #(D)
    system "gs -q -dNOPAUSE ".                                      #(E)
           "-sOUTPUTFILE=- -sDEVICE=ljet4 -r600x600 ".              #(F)
           "$_".                                                    #(G)
           " -c quit | lp -d elt339";                               #(H)
}
