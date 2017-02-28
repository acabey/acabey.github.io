#!/usr/bin/perl -w
use strict;

# EvalForExceptions1.pl

while (1) {                                                        #(A)
    eval {                                                         #(B)
        print "What is the volume: "; chomp( my $vol = <STDIN> );  #(C)
        print "What is the length: "; chomp( my $len = <STDIN> );  #(D)
        print "What is the width: "; chomp( my $wid = <STDIN> );   #(E)

        if ( ($vol < 0) || ($len <= 0) || ($wid <= 0) ) {          #(F)
            die "Illegal data entry by user.  Try again.\n";       #(G)
        }

        print "The height is: ", $vol / ( $len * $wid ), "\n";     #(H)
    };
    if ( $@ ) {                                                    #(I)
        print "Error report from eval: $@";                        #(J)
    }
}
