#!/usr/bin/perl -w

###  Deadlock.pl

use strict;
use threads;                    
use threads::shared;            

my $a : shared = 0;                                                  #(A)
my $b : shared = 0;                                                  #(B)

threads->new( \&sub1 );                                              #(C)
threads->new( \&sub2 );                                              #(D)
foreach (threads->list) { $_->join }                                 #(E)

sub sub1 {                                                           #(F)
    lock( $a );                                                      #(G)
    keepBusy( 1 );                                                   #(H)
    lock( $b );                                                      #(I)
    $b++;                                                            #(J)
    print "sub1:   \$a = $a   \$b = $b\n";                           #(K)
}

sub sub2 {                                                           #(L)
    lock( $b );                                                      #(M)
    keepBusy( 1 );                                                   #(N)
    lock( $a );                                                      #(O)
    $a++;                                                            #(P)
    print "sub2:   \$a = $a   \$b = $b\n";                           #(Q)
}

sub keepBusy {                                                       #(R)
    my $how_many_seconds = shift;                                    #(S)
    my $curr = time;                                                 #(T)
    while ( time < $curr + $how_many_seconds ) {}                    #(U)
}
