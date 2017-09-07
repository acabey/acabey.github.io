#!/usr/bin/perl -w

###  NoThreadInterference.pl

use strict;
use threads;
use threads::shared;                       

my @dataObj : shared = (50, 50);                                     #(A)

my $t1 = threads->create( \&repeatedSwaps );                         #(B)
my $t2 = threads->create( \&repeatedSwaps );                         #(C)
my $t3 = threads->create( \&repeatedSwaps );                         #(D)

$t1->join;                                                           #(E)
$t2->join;                                                           #(F)
$t3->join;                                                           #(G)

sub itemSwap {                                                       #(H)
    lock( @dataObj );                                                #(I)
    my $x = int ( -4.999999 + rand(10 ) );                           #(J)
    $dataObj[0] -= $x;                                               #(K)
    keepBusy();                                                      #(L)
    $dataObj[1] += $x;                                               #(M)
}

sub keepBusy {                                                       #(N)
    my $i = 0;                                                       #(O)
    while ( $i++ < 10000 ) {}                                        #(P)
}

sub test {                                                           #(Q)
    lock( @dataObj );                                                #(R)
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
