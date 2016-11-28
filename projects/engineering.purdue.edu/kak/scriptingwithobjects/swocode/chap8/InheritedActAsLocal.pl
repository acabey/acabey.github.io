#!/usr/bin/perl -w
use strict;

### InheritedActAsLocal.pl

#----------------------------   Class X  ------------------------------
package X;                                                          #(A)

sub new { bless {}, $_[0] }                                         #(B)

sub foo {                                                           #(C)
    my $self = shift;                                               #(D)
    print "X's foo invoked\n";                                      #(E)
    print "  foo(): instance is of type: ", ref( $self ), "\n";     #(F)
    $self->baz();                                                   #(G)
}

sub baz {                                                           #(H)
    my $self = shift;                                               #(I)
    print "X's baz invoked\n";                                      #(J)
    print "  baz(): instance is of type: ", ref( $self ), "\n";     #(K)
}

#----------------------------   Class Y  ------------------------------
package Y;                                                          #(L)

@Y::ISA = qw( X );                                                  #(M)

sub new { bless {}, $_[0] }                                         #(N)

sub bar {                                                           #(O)
    my $self = shift;                                               #(P)
    print "Y's bar invoked\n";                                      #(Q)
    $self->foo();                                                   #(R)
}

sub baz {                                                           #(S)
    my $self = shift;                                               #(T)
    print "Y's baz invoked\n";                                      #(U)
    print "  baz(): instance is of type: ", ref( $self ), "\n";     #(V)
}

#--------------------------   Test Code  ------------------------------
package main;                                                       #(W)

my $y_obj = Y->new();                                               #(Y)
$y_obj->bar();                                                      #(Z)
