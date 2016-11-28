#!/usr/bin/perl -w

###  ThreadsBasicWithJoin.pl

use strict;
use threads;

### ThreadsBasic.pl

my $t1 = threads->create(\&print_message, "Good");                   #(A)
my $t2 = threads->create(\&print_message, "Morning");                #(B)
my $t3 = threads->create(\&print_message, "to");                     #(C)

$t1->join;                                                           #(D)
$t2->join;                                                           #(E)
$t3->join;                                                           #(F)

print "you!\n";                                                      #(G)

sub print_message {                                                  #(E)
    my $message = shift;                                             #(F)
    print "$message ";                                               #(G)
#    my $i = 0;                                                      #(H)
#    while ( $i++ < 100000 ) {}                                      #(I)
}
