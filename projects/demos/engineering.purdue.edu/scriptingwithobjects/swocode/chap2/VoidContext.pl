#!/usr/bin/perl -w                                           

## VoidContext.pl

use strict;                                                  

&func;          #output: scalar context invoked                    #(A)

sub func {                                                         #(B)
    if ( wantarray ) {                                             #(C)
        print "list context invoked\n";                            #(D)
        return qw/miss bo peep/;                                   #(E)
    } else {                                                       #(F)
        print "scalar context invoked\n";                          #(G)
	return "peep";                                             #(H)
    }
}
