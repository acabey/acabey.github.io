#!/usr/bin/perl -w

###  ThreadCooperationWithSleep.pl

use strict;
use threads;                                                         #(A)

my @threads;                                                         #(B)
foreach my $i (1 .. 10) {                                            #(C)
    $threads[$i] = threads->new( \&do_it );                          #(D)
}

foreach my $i (1 .. 10) {                                            #(E)
    $threads[$i]->join;                                              #(F)
}

sub keepBusy {                                                       #(G)
    my $how_many_seconds = shift;                                    #(H)
    my $curr = time;                                                 #(I)
    while ( time < $curr + $how_many_seconds ) {}                    #(J)
}

sub do_it {                                                          #(K)
    my $threadID = threads->self->tid();                             #(L)
    keepBusy( int(rand(5)) );                                        #(M)
    # Threads with even ID's to sleep for 10 seconds:
    sleep( 10 ) unless $threadID % 2;                                #(N)
    my $curr = time;                                                 #(O)
    # Get just the last two digits of the 
    # current time in seconds:
    my ($seconds) = $curr =~ /(\d\d)$/;                              #(P)
    print "do_it executed by thread $threadID at time $seconds\n";   #(Q)
}
