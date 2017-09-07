#!/usr/bin/perl -w
use strict;

### DieForExit.pl

while (1) {                                                     #(A)
    print "What is the volume: "; chomp( my $vol = <STDIN> );   #(B)
    print "What is the length: "; chomp( my $len = <STDIN> );   #(C)
    print "What is the width: "; chomp( my $wid = <STDIN> );    #(D)

    if ( $vol < 0 or $len <= 0 or $wid <= 0 ) {                 #(E)
        die "Illegal data entry by user.  Stopped";             #(F)
    }

    print "The height is: ", $vol / ( $len * $wid ), "\n";      #(G)
}
