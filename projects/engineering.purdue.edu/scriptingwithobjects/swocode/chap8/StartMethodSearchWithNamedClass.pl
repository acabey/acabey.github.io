#!/usr/bin/perl -w
use strict;

### StartMethodSearchWithNamedClass.pl

#------------------------------ Class X -------------------------------
package X;                                                          #(A)   
sub new { bless {}, $_[0] }                                         #(B)
sub foo {                                                           #(C)
    print "X's foo invoked\n";                                      #(D)
}

#------------------------------ Class Y -------------------------------
package Y;                                                          #(E)
@Y::ISA = qw( X );                                                  #(F)
sub new { bless {}, $_[0] }                                         #(G)

#------------------------------ Class Z -------------------------------
package Z;                                                          #(H)
@Z::ISA = qw( Y );                                                  #(I)
sub new { bless {}, $_[0] }                                         #(J)
sub foo {                                                           #(K)
    my $self = shift;                                               #(L)
    print "Z's foo invoked\n";                                      #(M)
    $self->SUPER::foo();                                            #(N)
}

#--------------------------  namespace main ---------------------------
package main;                                                       #(O)

my $z_obj = Z->new();                                               #(P)

$z_obj->foo();                       # Z's foo invoked              #(Q)
                                     # X's foo invoked              #(R)

$z_obj->Y::foo();                    # X's foo invoked              #(S)
