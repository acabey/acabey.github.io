#!/usr/bin/perl -w

###  InterferenceAnyway.pl

use strict;
use threads;
use threads::shared;                       

my $p : shared = 50;                                                 #(A)
my $q : shared = 50;                                                 #(B)

my @dataObj : shared = (\$p, \$q);                                   #(C)

threads->create( \&repeatedSynchronizedSwaps );                      #(D)
threads->create( \&repeatedSynchronizedSwaps );                      #(E)
threads->create( \&repeatedSwaps );                                  #(F)
threads->create( \&repeatedSwaps );                                  #(G)

foreach (threads->list) { $_->join; }                                #(H)

sub itemSwapSynchronized {                                           #(I)
    lock( @dataObj );                                                #(J)
    my $x = int ( -4.999999 + rand(10 ) );                           #(K)
    ${$dataObj[0]} += $x;                                            #(L)
    keepBusy();                                                      #(M)
    ${$dataObj[1]} -= $x;                                            #(N)
}

sub itemSwap {                                                       #(O)
#    lock($p);                                                       #(P)
#    lock($q);                                                       #(Q)
    my $x = int ( -4.999999 + rand(10 ) );                           #(R)
    $p += $x;                                                        #(S)
    keepBusy();                                                      #(T)
    $q -= $x;                                                        #(U)
}

sub keepBusy {                                                       #(V)
    my $i = 0;                                                       #(W)
    while ( $i++ < 10000 ) {}                                        #(X)
}

sub test {                                                           #(Y)
    lock( @dataObj );                                                #(Z)
    lock($p);                                                        #(a)
    lock($q);                                                        #(b)
    my $sum = ${$dataObj[0]} + ${$dataObj[1]};                       #(c)
    print "Sum: $sum\n";                                             #(d)
}

sub repeatedSynchronizedSwaps {                                      #(e)
    my $j = 0;                                                       #(f)
    while ( $j++ < 500 ) {                                           #(g)
        itemSwapSynchronized();                                      #(h)
        test() unless $j % 100;                                      #(i)
    }
}

sub repeatedSwaps {                                                  #(j)
    my $j = 0;                                                       #(k)
    while ( $j++ < 500 ) {                                           #(l)
        itemSwap();                                                  #(m)
        test() unless $j % 100;                                      #(n)
    }
}
