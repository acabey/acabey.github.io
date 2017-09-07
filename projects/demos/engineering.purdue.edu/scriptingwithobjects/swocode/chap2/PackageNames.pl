#!/usr/bin/perl -w

# PackageNames.pl

use strict;

my $a = 10;                                                         #(A)
$main::x = 100;                                                     #(B)
our $y = 101;                                                       #(C)
print "$a \n";                                # 10                  #(D)
#print "$x \n";                               # ERROR               #(E)
print "$y \n";                                # 101                 #(F)
print "$main::x \n";                          # 100                 #(G)
print "$main::y \n";                          # 101                 #(H)

package Pack1;                                                      #(I)
my $b = 20;                                                         #(J)
our $x = 1000;                                                      #(K)
$Pack1::y = 1001;                                                   #(L)
print "$x $y \n";                             # 1000 101            #(M)
print "$x $Pack1::y \n";                      # 1000 1001           #(N)

package Pack2;                                                      #(O)
my $c = 30;                                                         #(P)
our $x = 2000;                                                      #(Q)

package Pack1;                                                      #(R)
{                                                                   #(S)
    package Pack3;                                                  #(T)
    our $x = 3000;                                                  #(U)
    $Pack3::y = 3001;                                               #(V)
    $Pack2::y = 2001;                                               #(W)
    $Pack3::z = 3002;                                               #(X)
}                                                                   #(Y)
our $z = 1002;                                                      #(Z)

package Pack2;                                                      #(a)
our $z = 2002;                                                      #(b)

package main;                                                       #(c)
our $z = 102;                                                       #(d)

#A "my" variable hides
#a global of the same
#name:
print "$z \n";                                # 102                 #(e)
my $z = 40;                                   # WARNING             #(f)
print "$z \n";                                # 40                  #(g)

#Show values of all 
#variables in this script:
print "$a $b $c $z \n";                       # 10 20 30 40         #(h)
print "$x \n";                                # 2000                #(i)
print "$main::x $main::y $::z \n";            # 100 101 102         #(j)
print "$Pack1::x $Pack1::y $Pack1::z \n";     # 1000 1001 1002      #(k)
print "$Pack2::x $Pack2::y $Pack2::z \n";     # 2000 2001 2002      #(l)
print "$Pack3::x $Pack3::y $Pack3::z \n";     # 3000 3001 3002      #(m)

#Show all names in 
#Pack1 stash:
print join "\n", keys %Pack1::;                                     #(n)
                                              # x
                                              # y
                                              # z
#Show all names in 
#main stash:
print join "\n", keys %main::;                                      #(o)
                                              # STDOUT
                                              # STDIN
                                              #  ...
                                              # x
                                              # y
                                              # z
                                              #  ...
