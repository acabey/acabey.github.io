#!/usr/bin/perl -w
  
## IgnoreCase.pl 

use strict;

print "Did you exercise today:\n";                                  #(A)

my $input_string = <>;                                              #(B)

my ($answer) = ( $input_string =~ /^\s*(y(es)?|(no?))\s*$/i );      #(C)

if (!$answer) {                                                     #(D)
    print "That was not a legal answer\n";                          #(E)
    exit(1);                                                        #(F)
}

if ( $answer =~ /y(es)?/i ) {                                       #(G)
    print "Great, you were good today\n";                           #(H)
    exit 0;                                                         #(I)
}

if ( $answer =~ /n(o)?/i ) {                                        #(J)
    print "Uh oh! you were bad today\n";                            #(K)
    exit 0;                                                         #(L)
}
