#!/usr/bin/perl -w

###  ThreadsBasic.pl

use strict;
use threads;

### ThreadsBasic.pl

my $t1 = threads->create(\&print_message, "Good");                   #(A)
my $t2 = threads->create(\&print_message, "Morning");                #(B)
my $t3 = threads->create(\&print_message, "to");                     #(C)

print "you!\n";                                                      #(D)

sub print_message {                                                  #(E)
    my $message = shift;                                             #(F)
    print "$message ";                                               #(G)
#    my $i = 0;                                                      #(H)
#    while ( $i++ < 100000 ) {}                                      #(I)
}
