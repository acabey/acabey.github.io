#!/usr/bin/perl -w
use strict;

### CanMethod.pl

#----------------------------  Class X  -------------------------------
package X;                                                          #(A)

sub new { bless {}, $_[0] }                                         #(B)

sub foo {                                                           #(C)
    print "X's foo invoked\n";
}

#----------------------------  Class Y  -------------------------------
package Y;                                                          #(D)

sub new { bless {}, $_[0] }                                         #(E)

sub bar {                                                           #(F)
    print "Y's bar invoked\n";
}

#----------------------------  Class Z  -------------------------------
package Z;                                                          #(G)

@Z::ISA = qw( X Y );                                                #(H)

sub new { bless {}, $_[0] }                                         #(I)

sub baz {                                                           #(J)
    print "Z's baz invoked\n";
}

#------------------------------  main  --------------------------------
package main;                                                       #(K)

my $obj = Z->new();                                                 #(L)

print $obj->can( "foo" )   ? "yes\n" : "no\n";  # yes               #(M)

print Z->can( "foo" )      ? "yes\n" : "no\n";  # yes               #(N)

my $which_func = $obj->can( "foo" ) ||                              #(O)
                 $obj->can( "bar" ) ||                              #(P)
                 $obj->can( "baz" );                                #(Q)
&$which_func;                                   # X's foo invoked   #(R)
