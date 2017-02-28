#!/usr/bin/perl -w                                           

## WantArray.pl

use strict;                                                  

my @x = &func;                                                     #(A)
print "@x\n";                     # miss bo peep                   #(B)

my $y = &func;                                                     #(C)
print "$y\n";                     # peep                           #(D)

sub func {                                                         #(E)
    if ( wantarray ) {                                             #(F)
        return qw/miss bo peep/;                                   #(G)
    } else {                                                       #(H)
	return "peep";                                             #(I)
    }
}
