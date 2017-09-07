#!/usr/bin/perl -w
use strict;

# ClosureBasic.pl

sub make_offset_counter {                                             #(A)
    my $offset = shift;                                               #(B)
    sub { ++$offset; };                                               #(C)
}


my $counter1 = &make_offset_counter( 10 );                            #(D)
my $counter2 = &make_offset_counter( 100 );                           #(E)
my $counter3 = &make_offset_counter( 1000 );                          #(F)

print $counter1->(), "\n";             # 11                           #(G)
print $counter1->(), "\n";             # 12                           #(H)
print $counter1->(), "\n";             # 13                           #(I)

print $counter2->(), "\n";             # 101                          #(J)
print $counter2->(), "\n";             # 102                          #(K)
print $counter2->(), "\n";             # 103                          #(L)

print $counter3->(), "\n";             # 1001                         #(M)
print $counter3->(), "\n";             # 1002                         #(N)
print $counter3->(), "\n";             # 1003                         #(O)
