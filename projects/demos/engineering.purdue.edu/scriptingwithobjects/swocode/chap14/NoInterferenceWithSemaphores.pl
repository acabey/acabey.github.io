#!/usr/bin/perl -w

###  NoInterferenceWithSemaphores.pl

use strict;
use threads;
use threads::shared;                       
use Thread::Semaphore;

my $semaphore1 = Thread::Semaphore->new();                           #(A)
my $semaphore2 = Thread::Semaphore->new();                           #(B)

my @dataObj : shared = (50, 50);                                     #(C)

threads->create( \&repeatedSwaps );                                  #(D)
threads->create( \&repeatedSwaps );                                  #(E)
threads->create( \&repeatedSwaps );                                  #(F)

foreach (threads->list) { $_->join; }                                #(G)

sub itemSwap {                                                       #(H)
    $semaphore1->down;                                               #(I)
    my $x = int ( -4.999999 + rand(10 ) );                           #(J)
    $dataObj[0] -= $x;                                               #(K)
    keepBusy();                                                      #(L)
    $dataObj[1] += $x;                                               #(M)
    $semaphore1->up;                                                 #(N)
}

sub keepBusy {                                                       #(O)
    my $i = 0;                                                       #(P)
    while ( $i++ < 10000 ) {}                                        #(Q)
}

sub test {                                                           #(R)
    $semaphore2->down;                                               #(S)
    my $thread_id = threads->self->tid();                            #(T)
    my $sum = $dataObj[0] + $dataObj[1];                             #(U)
    print "Thread $thread_id   Sum: $sum\n";                         #(V)
    $semaphore2->up;                                                 #(W)
}

sub repeatedSwaps {                                                  #(X)
    my $j = 0;                                                       #(Y)
    while ( $j++ < 500 ) {                                           #(Z)
        itemSwap();                                                  #(a)
        test() unless $j % 100;                                      #(b)
    }
}
