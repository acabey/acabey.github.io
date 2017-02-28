#!/usr/bin/perl -w                                                 
use strict;                                                        

##  WhileWithContinue.pl

print "Enter numbers, one per line. When done, just enter return\n"; #(A)

my ($sum_even, $sum_odd) = (0,0);                                    #(B)

print "Number: ";                                                    #(C)
while (<>) {                                                         #(D)
    if ( $_ =~ /^\d+$/ && $_ % 2 == 0 ) { $sum_even += $_ }          #(E)
    elsif ( $_ =~ /^\d+$/ &&  $_ % 2 != 0 ) { $sum_odd += $_ }       #(F)
    elsif (/^\s*$/) {                                                #(G)
        printf "Sum of even numbers is: %d\n", $sum_even;            #(H)
        printf "Sum of odd numbers is: %d\n", $sum_odd;              #(I)
        last;                                                        #(J)
    } else { print "Entry not recognized. Try again.\n" }            #(K)
} continue { print "Number: "; }                                     #(L)
