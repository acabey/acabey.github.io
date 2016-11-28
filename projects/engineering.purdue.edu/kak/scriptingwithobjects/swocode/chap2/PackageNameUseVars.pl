#!/usr/bin/perl -w

# PackageNamesUseVars.pl

use strict;

package Pack1;                                                      #(A)
use vars qw/$u $v/;                                                 #(B)
$u = 2000;                                                          #(C)
$v = 2001;                                                          #(D)
our $x = 1000;                                                      #(E)
our $y = 1001;                                                      #(F)
$Pack1::z = 1002;                                                   #(G)
print "$u $v \n";                          # 2000 2001              #(H)
print "$x $y $Pack1::z \n";                # 1000 1001 1002         #(I)

package Pack2;                                                      #(J)
#print "$u $v \n";                         # ERROR                  #(K)
print "$Pack1::u $Pack1::v \n";            # 2000 2001              #(L)
print "$x $y $Pack1::z \n";                # 1000 1001 1002         #(M)
print "$Pack1::x $Pack1::y $Pack1::z \n";  # 1000 1001 1002         #(M)
{                                                                   #(N)
    our $w  = 3000;                                                 #(O)
    use vars qw/$t/;                                                #(P)
    $t = 4000;                                                      #(Q)
}                                                                   #(R)
print "$x $y $Pack1::z \n";                # 1000 1001 1002         #(S)
#print "$w \n";                            # ERROR                  #(T)
print "$Pack2::w \n";                      # 3000                   #(U)
print "$t \n";                             # 4000                   #(V)
print "$Pack2::t \n";                      # 4000                   #(W)

package main;                                                       #(X)
print "$Pack2::w \n";                      # 3000                   #(Y)
#print "$t \n";                            # ERROR                  #(Z)
print "$Pack2::t \n";                      # 4000                   #(a)
