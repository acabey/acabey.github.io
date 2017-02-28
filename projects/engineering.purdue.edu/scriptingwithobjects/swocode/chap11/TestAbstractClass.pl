#!/usr/bin/perl -w

# TestAbstractClass.pl

use strict;

use Circle;                                                        #(T1)
use Rectangle;                                                     #(T2)

my $shape1 = Circle->new( 2.5 );                                   #(T3)
print $shape1->area(), "\n";                                       #(T4)
print $shape1->circumference(), "\n";                              #(T5)
#$shape1->some_property();               # ERROR                   #(T6)

my $shape2 = Rectangle->new(3, 4 );                                #(T7)
print $shape2->area(), "\n";                                       #(T8)
print $shape2->circumference(), "\n";                              #(T9)
#$shape2->some_property();               # ERROR                  #(T10)

#my $shape = Shape->new();               # ERROR                  #(T11)
