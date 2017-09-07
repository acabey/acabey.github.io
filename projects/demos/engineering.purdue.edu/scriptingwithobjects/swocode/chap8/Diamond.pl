#!/usr/bin/perl -w
use strict;

### Diamond.pl

#---------------------------   Class X   ------------------------------
package X;                                                          #(A)

sub new { bless {}, $_[0] }                                         #(B)
sub foo {                                                           #(C)
    my $self = shift;
    return if $self->{_foo}{__PACKAGE__}++;                         #(D)
    print "X's foo invoked\n";   
}

#---------------------------   Class Y   ------------------------------
package Y;                                                          #(E)

@Y::ISA = qw( X );                                                  #(F)

sub new { bless {}, $_[0] }                                         #(G)
sub bar {                                                           #(H)
    my $self = shift;
    print "Y's bar invoked\n";                                      #(I)
    $self->SUPER::foo();                                            #(J)
}

#---------------------------   Class Z   ------------------------------
package Z;                                                          #(K)

@Z::ISA = qw( X );                                                  #(L)
sub new { bless {}, $_[0] }                                         #(M)
sub baz {                                                           #(N)
    my $self = shift;
    print "Z's baz invoked\n";                                      #(O)
    $self->SUPER::foo();                                            #(P)
}

#---------------------------   Class Z   ------------------------------
package W;                                                          #(Q)

@W::ISA = qw( Y Z );                                                #(R)
sub new { bless {}, $_[0] }                                         #(S)
sub foo {                                                           #(T)
    my $self = shift;
    print "W's foo invoked\n";                                      #(U)
    $self->bar();                                                   #(V)
    $self->baz();                                                   #(Z)
}
 
#---------------------------- package main -----------------------------
package main;                                                       #(a)

my $w_obj = W->new();                                               #(b)
$w_obj->foo();                                                      #(c)
