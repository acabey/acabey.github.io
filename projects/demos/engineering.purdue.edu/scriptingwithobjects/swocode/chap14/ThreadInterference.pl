#!/usr/bin/perl -w

###  ThreadInterference.pl

use strict;
use threads;                                                         #(A)
use threads::shared;                                                 #(B)

my @dataObj : shared = (50, 50);                                     #(C)

my $t1 = threads->create( \&repeatedSwaps );                         #(D)
my $t2 = threads->create( \&repeatedSwaps );                         #(E)
my $t3 = threads->create( \&repeatedSwaps );                         #(F)

$t1->join;                                                           #(G)
$t2->join;                                                           #(H)
$t3->join;                                                           #(I)

sub itemSwap {                                                       #(J)
    my $x = int ( -4.999999 + rand(10 ) );                           #(K)
    $dataObj[0] += $x;                                               #(L)
    keepBusy();                                                      #(M)
    $dataObj[1] -= $x;                                               #(N)
}

sub keepBusy {                                                       #(O)
    my $i = 0;                                                       #(P)
    while ( $i++ < 10000 ) {}                                        #(Q)
}

sub test {                                                           #(R)
    my $sum = $dataObj[0] + $dataObj[1];                             #(S)
    print "Sum: $sum\n";                                             #(T)
}

sub repeatedSwaps {                                                  #(U)
    my $j = 0;                                                       #(V)
    while ( $j++ < 500 ) {                                           #(W)
        itemSwap();                                                  #(X)
        test() unless $j % 100;                                      #(Y)
    }
}
