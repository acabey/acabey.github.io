#!/usr/bin/perl -w
use strict;

### DerivedLocalVars.pl

#-------------------------   class Base  -------------------------------
package Base;                                                       #(A)

my $_count = 0;                                                     #(B)
my $_count_incrementer = sub { $_count++; };                        #(C)
my $_count_decrementer = sub { $_count--; };                        #(D)

sub new {                                                           #(E)
    my $class = shift;                                              #(F)
    &$_count_incrementer;                                           #(G)
    bless {}, $class;                                               #(H)
}
sub DESTROY {                                                       #(I)
    &$_count_decrementer;                                           #(J)
}
sub get_count {                                                     #(K)
    print "base objects count : $_count\n";                         #(L)
}

#------------------------   class Derived  -----------------------------
package Derived;                                                    #(M)
@Derived::ISA = qw( Base );                                         #(N)

my $_count = 0;                                                     #(O)
my $_count_incrementer = sub { $_count++; };                        #(P)
my $_count_decrementer = sub { $_count--; };                        #(Q)

sub new {                                                           #(R)
    my $class = shift;                                              #(S)
    my $self = $class->SUPER::new(@_[1..$#_]);                      #(T)
    &$_count_incrementer;                                           #(U)
    bless $self, $class;                                            #(V)
}
sub DESTROY {                                                       #(W)
    my $self = shift;                                               #(X)
    $self->SUPER::DESTROY();                                        #(Z)
    &$_count_decrementer;                                           #(a)
}
sub get_count {                                                     #(b)
    print "derived objects count : $_count\n";                      #(c)
}

#---------------------------   Test Code  ------------------------------   

package main;                                                       #(d)

my $base_obj_1 = Base->new();                                       #(e)
$base_obj_1->get_count();            # base objects count: 1        #(f)

my $base_obj_2 = Base->new();                                       #(g)
$base_obj_2->get_count();            # base objects count : 2       #(h)

$base_obj_1 = undef;                                                #(i)
$base_obj_2->get_count();            # base objects count : 1       #(j)

my $derived_obj_1 = Derived->new();                                 #(k)
$derived_obj_1->get_count();         # derived objects count : 1    #(l)
$derived_obj_1->Base::get_count();   # base objects count: 2        #(m)

my $derived_obj_2 = Derived->new();                                 #(n)
$derived_obj_2->get_count();         # derived objects count : 2    #(o)
$derived_obj_2->Base::get_count();   # base objects count : 3       #(p)

$derived_obj_1 = undef;                                             #(q)
$derived_obj_2->get_count();         # derived objects count : 1    #(r)
$derived_obj_2->Base::get_count();   # base objects count : 2       #(s)
