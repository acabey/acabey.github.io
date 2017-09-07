#!/usr/bin/perl -w
use strict;

### Rebless.pl

#----------------------------  Class X  -------------------------------
package X;                                                          #(A)

sub new {                                                           #(B)
    my ($class, $intvalue) = @_;                                    #(C)
    bless { _intvalue => $intvalue }, $class;                       #(D)
}

sub DESTROY {                                                       #(E)
    my $self = shift;                                               #(F)
    my $s = $self->{_intvalue};                                     #(G)
    print "An X instance with int value $s to be destroyed\n";      #(H)
}

#----------------------------  Class Y  -------------------------------
package Y;                                                          #(I)

sub DESTROY {                                                       #(J)
    print "A Y instance is about to be destroyed\n";                #(K)
}             

#---------------------------  Test Code   -----------------------------
package main;                                                       #(L)

my $x1 = X->new(100);                                               #(M)
my $x2 = X->new(200);                                               #(N)
my $x3 = $x1;                                                       #(O)

print ref( $x1 ), "\n";                # X                          #(P)
print ref( $x2 ), "\n";                # X                          #(Q)
print ref( $x3 ), "\n";                # X                          #(R)

bless $x1, "Y";                                                     #(S)

print ref( $x1 ), "\n";                # Y                          #(T)
print ref( $x2 ), "\n";                # X                          #(U)
print ref( $x3 ), "\n";                # Y                          #(V)

$x1 = undef;                                                        #(W)

$x2 = undef;                                                        #(X)
              # An X instance with int value 200 to be destroyed
$x3 = undef;                                                        #(Y)
              # A Y instance is about to be destroyed
