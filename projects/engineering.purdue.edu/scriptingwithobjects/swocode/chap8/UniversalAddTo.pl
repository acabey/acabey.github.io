#!/usr/bin/perl -w
use strict;

### UniversalAddTo.pl

#--------------------------  Class X  ---------------------------------
package X;                                                          #(A)   

sub new { bless {}, $_[0] }                                         #(B)

sub bar {                                                           #(C)
    my $self = shift;
    print "X's bar called\n";                                       #(D)
    $self->foo();                                                   #(E)
}

#--------------------------  Class Y  ---------------------------------
package Y;                                                          #(F)

sub new { bless {}, $_[0] }                                         #(G)

#--------------------------  Class Z  ---------------------------------
package Z;                                                          #(H)

@Z::ISA = qw( X Y );                                                #(I)

sub new { bless {}, $_[0] }                                         #(J)

sub boohoo { print "Z's boohoo invoked\n" }                         #(K)

#---------------------------  main  -----------------------------------
package main;                                                       #(L)

sub UNIVERSAL::foo {                                                #(M)
    my $self = shift;
    my ($package, $filename, $line) = caller;                       #(N)
    print "UNIVERSAL's foo called by $package\n";                   #(O)
    $self->boohoo();                                                #(P)
}

sub X::baz {                                                        #(Q)
    my $self = shift;                                        
    print "X's baz called\n"; 
    $self->foo();                                                   #(R)
}

my $obj = Z->new();                                                 #(S)
$obj->can('foo') ? print "yes to foo in Z\n" 
                              : print "no to foo in Z\n";           #(T)

$obj->bar();              # X's bar called                          #(U)
                          # UNIVERSAL's foo called by X
                          # Z's boohoo invoked

$obj->baz();              # X's baz called                          #(V)
                          # UNIVERSAL's foo called by main
                          # Z's boohoo invoked

my $obj2 = X->new();                                                #(W)
$obj2->foo();             # UNIVERSAL's foo called by main          #(X)
                          # >>>>> Runtime exception thown <<<<<
