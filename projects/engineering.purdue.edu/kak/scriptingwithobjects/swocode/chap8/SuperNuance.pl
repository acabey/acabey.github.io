#!/usr/bin/perl -w
use strict;

### SuperNuance.pl

#------------------------- X, Y, Z Class Hierarchy --------------------
package X;                                                          #(A)   
sub new { bless {}, $_[0] }                                         #(B)
sub foo {                                                           #(C)
    print "X's foo invoked\n";   
}

package Y;                                                          #(D)
@Y::ISA = qw( X );                                                  #(E)
sub new { bless {}, $_[0] }                                         #(F)
sub foo {                                                           #(G)
    my $self = shift;
    print "Y's foo invoked\n";   
    $self->SUPER::foo();                                            #(H)
}

package Z;                                                          #(I)
@Z::ISA = qw( Y );                                                  #(J)
sub new { bless {}, $_[0] }                                         #(K)
sub bar {                                                           #(L)
    my $self = shift;
    $self->SUPER::foo();                                            #(M)
}

#-------------------------- T, U Class Hierarchy ----------------------
package T;                                                          #(N)
sub new { bless {}, $_[0] }                                         #(O)
sub foo {                                                           #(P)
    print "T's foo invoked\n";      
}
 
package U;                                                          #(Q)
@U::ISA = qw( T );                                                  #(R)
sub new { bless {}, $_[0] }                                         #(S)
sub bar {                                                           #(T)
    my $z_obj = Z->new(); 
    $z_obj->SUPER::foo();                                           #(U)
}

#---------------------------- package main -----------------------------
package main;                                                       #(V)

my $z_obj = Z->new();                                               #(W)
$z_obj->bar();                     # Y's foo invoked                #(X)
                                   # X's foo invoked
my $u_obj = U->new();                                               #(Y)
$u_obj->bar();                     # T's foo invoked                #(Z)
