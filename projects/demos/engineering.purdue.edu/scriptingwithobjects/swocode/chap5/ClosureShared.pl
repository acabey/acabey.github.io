#!/usr/bin/perl -w
use strict;

# ClosureShared.pl

sub make_two_offset_counters {                                        #(A)
    my $offset = shift;                                               #(B)
    sub { ++$offset; }, sub{ ++$offset; }                             #(C)
}

my ($c1, $c2) = &make_two_offset_counters( 10 );                      #(D) 
my ($c3, $c4) = &make_two_offset_counters( 100 );                     #(E)

print $c1->(), ' ', $c3->(), "\n";            # 11 101                #(F)
print $c2->(), ' ', $c4->(), "\n";            # 12 102                #(G)   
print $c1->(), ' ', $c3->(), "\n";            # 13 103                #(H)
print $c2->(), ' ', $c4->(), "\n";            # 14 105                #(I)
