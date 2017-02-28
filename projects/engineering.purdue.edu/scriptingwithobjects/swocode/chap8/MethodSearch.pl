#!/usr/bin/perl -w
use strict;

### MethodSearch.pl

#------------------------------  class  X  -----------------------------
package X;                                                          #(A)

sub new { bless [], shift }                                         #(B)

sub foo { print "foo of class X called\n" }                         #(C)

#-----------------------------  class Y  -------------------------------
package Y;                                                          #(D)

sub new { bless [], shift }                                         #(E)

sub bar { print "bar of class Y called\n"}                          #(F)

sub AUTOLOAD {                                                      #(G)
    print "AUTOLOAD of class Y invoked by " .                       #(H)
          "function call $Y::AUTOLOAD\n";
}                                                      

#-----------------------------  class Z  -------------------------------
package Z;                                                          #(I)

@Z::ISA = ('X', 'Y');                                               #(J)

sub new { bless [], shift }

#----------------------------  Test Code  -----------------------------
package main;                                                       #(K)

my $zobj = Z->new();                                                #(L)

$zobj->foo();        # foo of class X called                        #(M)

$zobj->bar();        # bar of class Y called                        #(N)

$zobj->jazz();                                                      #(O)
          # AUTOLOAD of class Y invoked by function call Z::jazz    #(P)
          # AUTOLOAD of class Y invoked by function call Z::DESTROY #(Q)
