#!/usr/bin/perl -w                                  

## ArgRef.pl

use strict;                                         

my @arr = qw/ hello mello yello /;                                 #(A)

print "@arr\n";           # hello mello yello                      #(B)

test( @arr );                                                      #(C)

print "@arr\n";           # hellohello mellomello yelloyello       #(D)

sub test {                                                         #(E)
    foreach (@_) {                                                 #(F)
        $_ = $_ . $_;                                              #(G)
    }
}
