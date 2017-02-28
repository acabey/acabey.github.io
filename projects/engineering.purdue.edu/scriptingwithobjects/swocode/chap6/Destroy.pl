#!/usr/bin/perl -w

### Destroy.pl

use strict;

package X;                                                    #(A)

sub new {                                                     #(B)
    my ($class, $index) = @_;                                 #(C)
    return bless {                                            #(D)
        _index => $index,                                     #(E)
    }, $class;                                                #(F)
}                     
sub get_index {                                               #(G)
    my $self = shift;                                         #(H)
    return $self->{_index};                                   #(I)
}
sub DESTROY {                                                 #(J)
    my $self = shift;                                         #(K)
    my $index = $self->get_index;                             #(L)
    print "X object with index $index being destroyed\n";     #(M)
}

package main;

my $x = X->new(1);                                            #(N)
my $y = X->new(2);                                            #(O)
my $z = X->new(3);                                            #(P)
push my @arr, ($x, $y, $z);                                   #(Q)

my @brr;                                                      #(R)
foreach (4..6) {                                              #(S)
    push @brr, X->new($_);                                    #(T)
}

@arr = undef;                                                 #(U)
@brr = undef;                                                 #(V)
                   # Output produced by the above statement:
                   #      X object with index 6 being destroyed
                   #      X object with index 5 being destroyed
                   #      X object with index 4 being destroyed
while (1) {}                                                  #(W)
