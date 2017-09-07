#!/usr/bin/perl -w                                  

## sub2.pl

use strict;                                         

my @arr = qw/ hello mello yello jello /;                           #(A)

my $index = find_index( "mello", @arr );                           #(B)

print "$index\n";                     # output: 1                  #(C)

sub find_index {                                                   #(D)
    my $arg = shift @_;                                            #(E)
    foreach (0..$#_) {                                             #(F)
        if ( $arg eq $_[$_] ) {                                    #(G)
            return $_;                                             #(H)
        } 
    }
    undef;                                                         #(I)
}
