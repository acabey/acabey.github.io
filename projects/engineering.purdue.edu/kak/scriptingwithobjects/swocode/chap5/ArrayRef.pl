#!/usr/bin/perl -w
use strict;

#  ArrayRef.pl

# Basics:
my @arr1 = (1, 2);                                                     #(A)
my $ref = \@arr1;                                                      #(B)
print "@$ref\n";                # 1 2                                  #(C)
print "$$ref[1]\n";             # 2                                    #(D)
$$ref[2] = 'three';                                                    #(E)
print "@arr1\n";                # 1 2 three                            #(F)

# The arrow notation:
my $a = $ref->[2];                                                     #(G)
print "$a\n";                   # three                                #(H)

# More basics:
push @arr1, 4;                                                         #(I)
print "@arr1\n";                # 1 2 three 4                          #(J)
push @$ref, 5;                                                         #(K)
print "@arr1\n";                # 1 2 three 4 5                        #(L)

# An array containing an array reference:
my @arr2 = (5, 6, $ref);                                               #(M)
print $arr2[2], "\n";           # ARRAY(0x805708c)                     #(N)
my @arr3 = @{$arr2[2]};                                                #(O)
print "@arr3\n";                # 1 2 three 4 5                        #(P)
print "@{$arr2[2]}\n";          # 1 2 three 4 5                        #(Q)
print ${$arr2[2]}[2], "\n";     # three                                #(R)

# An array containing a reference to itself:
unshift @arr1, $ref;                                                   #(S)
print "@arr1\n";                # ARRAY(0x805708c) 1 2 three 4 5       #(T)
pop @arr1;                                                             #(U)
print "@arr1\n";                # ARRAY(0x805708c) 1 2 three 4         #(V)
print "@{$arr1[0]}\n";          # ARRAY(0x805708c) 1 2 three 4         #(W)

# A donut:
my @donut;                                                             #(X)
unshift @donut, \@donut;                                               #(Y)
print "@donut\n";               # ARRAY(0x805d718)                     #(Z)
