#!/usr/bin/perl -w
#use strict;

# EvalForExceptions2.pl

my $x = \"You entered an illegal value. A reference \
          to this string is the argument to die.\n";               #(A)

while (1) {                                                        #(B)
    eval {                                                         #(C)
        print "What is the volume: "; chomp( my $vol = <STDIN> );  #(D)
        print "What is the length: "; chomp( my $len = <STDIN> );  #(E)
        print "What is the width: "; chomp( my $wid = <STDIN> );   #(F)

        if ( ($vol < 0) || ($len <= 0) || ($wid <= 0) ) {          #(G)
            die $x;                                                #(H)
        }

        print "The height is: ", $vol / ( $len * $wid ), "\n";     #(I)
    };
    if ( $@ ) {                                                    #(J)
        print ${$@};                                               #(K)
    }
}
