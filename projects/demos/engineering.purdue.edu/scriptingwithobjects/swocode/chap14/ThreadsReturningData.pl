#!/usr/bin/perl -w

###  ThreadsReturningData.pl

use strict;
use threads;

my @arr = 0..10;                                                     #(A)
print "@arr\n";                      # 0 1 2 3 4 5 6 7 8 9 10        #(B)

my $t1 = threads->create(\&shuffle, \@arr);                          #(C)
my $t2 = threads->create(\&shuffle, \@arr);                          #(D)
my $t3 = threads->create(\&shuffle, \@arr);                          #(E)

my $shuffled_1 = $t1->join;                                          #(F)
my $shuffled_2 = $t2->join;                                          #(G)
my $shuffled_3 = $t3->join;                                          #(H)

print "@$shuffled_1\n";              # 9 3 2 8 1 6 4 7 10 0 5        #(I)
print "@$shuffled_2\n";              # 4 2 1 5 6 10 9 0 8 3 7        #(J)
print "@$shuffled_3\n";              # 4 9 1 10 3 8 6 7 0 5 2        #(K)

print "@arr\n";                      # 0 1 2 3 4 5 6 7 8 9 10        #(L)
shuffle( \@arr );                                                    #(M)
print "@arr\n";                      # 7 6 1 5 3 2 8 4 0 10 9        #(N)

# Fisher-Yates shuffle:
sub shuffle {                                                        #(O)
    my $arr_ref = shift;                                             #(P)
    my $i = @$arr_ref;                                               #(Q)
    while (  $i-- ) {                                                #(R)
        my $j = int rand( $i + 1 );                                  #(S)
        @$arr_ref[ $i, $j ] = @$arr_ref[ $j, $i ];                   #(T)
    }                                                                #(U)
    return $arr_ref;                                                 #(V)
}
