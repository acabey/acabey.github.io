#!/usr/bin/perl -w

### StdErr.pl

use strict;

while ( my $input = <STDIN> ) {                                    #(A)
    print STDOUT "You said =>    $input";                          #(B)
    my $len = length $input;                                       #(C)
    print STDERR "$len\n";                                         #(D)
}
