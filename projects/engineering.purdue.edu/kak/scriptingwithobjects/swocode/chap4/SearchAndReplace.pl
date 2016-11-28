#!/usr/bin/perl -w
  
## SearchAndReplace.pl

use strict; 

my $input_string = "one hello is like any other hello";            #(A)
$input_string =~ s/hello/armadello/g;                              #(B)
print "$input_string\n";                                           #(C)
#                        one armadello is like any other armadello

$input_string = "apples     oranges\nbananas\t   pears";           #(D)
$input_string =~ s/\s+/ /g;                                        #(E)
print "$input_string\n";                                           #(F)
#                        apples oranges bananas pears

$_ = "apples oranges, bananas; pears\n";                           #(G)
s/\b(\w+)[.,;:]\s+//g;                                             #(H)
print;                                                             #(I)
#                        apples pears 

$_ = "http://programming_with_objects.com";                        #(J)
s#//#//www.#;                                                      #(K)
print "$_\n";                                                      #(L)
#                        http://www.programming_with_objects.com

$_ = "apples oranges bananas pears";                               #(M)
s{(\ba\w+)}{\U$1}g;                                                #(N)
print;                                                             #(O)
#                        APPLES oranges bananas pears

$_ = "Ha! You are so funny!";                                      #(P)
s/^(\S+)/$1 x 3/e;                                                 #(Q)
print;                                                             #(R)
#                        Ha!Ha!Ha! You are so funny!
