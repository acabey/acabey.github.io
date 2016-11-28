#!/usr/bin/perl -w
use strict;

### Inheritability.pl

package Base;                                                       #(A)

sub new {                                                           #(B)
    my $class = shift;                                              #(C)
    bless {}, $class;                                               #(D)
#   bless {};                                                       #(E)
}
sub foo {                                                           #(F)
    print "Base's foo invoked\n";                                   #(G)
}

package Derived;                                                    #(H)

@Derived::ISA = qw( Base );                                         #(I)
sub foo {                                                           #(J)
    my $self = shift;                                               #(K)
    print "Derived's foo invoked\n";                                #(L)
    $self->SUPER::foo();                                            #(M)
}

#---------------------------- package main -----------------------------
package main;                                                       #(N)

my $obj = Derived->new();                                           #(O)
$obj->foo();                   # Derived's foo invoked              #(P)
                               # Base's foo invoked                 #(Q)
