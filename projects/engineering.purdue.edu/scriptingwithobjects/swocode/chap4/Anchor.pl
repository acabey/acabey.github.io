#!/usr/bin/perl -w                                          
  
## Anchor.pl

use strict;                                                           

my $pattern = '^abra';                                              #(A)

my $input_string = "abracadabra";                                   #(B)
$input_string  =~  /$pattern/ ? print "Yes\n"          # Yes        #(C)
                              : print "No\n";                       #(D)

$input_string = "dabracababra";                                     #(E)
$input_string  =~  /$pattern/ ? print "Yes\n"                       #(F)
                              : print "No\n";          # No         #(G)

$pattern = 'dabra$';                                                #(H)

$input_string = "abracadabra";                                      #(I)
$input_string  =~  /$pattern/ ? print "Yes\n"          # Yes        #(J)
                              : print "No\n";                       #(K)

$input_string = "dabracababra";                                     #(L)
$input_string  =~  /$pattern/ ? print "Yes\n"                       #(M)
                              : print "No\n";          # No         #(N)

$pattern = '\bwhat';                                                #(O)

$input_string = "whatever will be will be";                         #(P)
$input_string  =~  /$pattern/ ? print "Yes\n"          # Yes        #(Q)
                              : print "No\n";                       #(R)

$input_string = "somewhat happier than thou";                       #(S)
$input_string  =~  /$pattern/ ? print "Yes\n"                       #(T)
                              : print "No\n";          # No         #(U)

$pattern = 'ever\b';                                                #(V)

$input_string = "whatever will be will be";                         #(W)
$input_string  =~  /$pattern/ ? print "Yes\n"          # Yes        #(X)
                              : print "No\n";                       #(Y)   

$input_string = "everywhere I go you go";                           #(Z)
$input_string  =~  /$pattern/ ? print "Yes\n"                       #(a)
                              : print "No\n";          # No         #(b)
