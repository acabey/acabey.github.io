#!/usr/bin/perl -w

### CircularRef1.pl

use strict;
use Scalar::Util qw( weaken );                                      #(A)

#---------------------------  class X  ---------------------------------
package X;                                                         #(X1)
    sub new {                                                      #(X2)
        my ($class, $id) = @_;                                     #(X3)
        print "Creating X object: id = " . $id . "\n";             #(X4)
        return bless { id => $id }, $class;                        #(X5)
    }
    sub setYfield {                                                #(X6)
        my ($ref, $yobj) = @_;                                     #(X7)
        $ref->{ yobj } = $yobj;                                    #(X8)
    }
    sub DESTROY {                                                  #(X9)
        my $ref = shift;                                          #(X10)
        print "X obj will be destroyed: id = " . $ref->{id} . "\n";
    }                                                             #(X11)

#---------------------------  class Y  ---------------------------------
package Y;                                                         #(Y1)
    sub new {                                                      #(Y2)
        my ($class, $id, $xobj) = @_;                              #(Y3)
        print "Creating Y object: id = " . $id . "\n";             #(Y4)
        return bless { id => $id, xob => $xobj }, $class;          #(Y5)
    }
    sub setXfield {                                                #(Y6)
        my ($ref, $xobj) = @_;                                     #(Y7)
        $ref->{ xobj } = $xobj;                                    #(Y8)
    }
    sub DESTROY {                                                  #(Y9)
        my $ref = shift;                                          #(Y10)
        print "Y obj will be destroyed: id = " . $ref->{id} . "\n";
    }                                                             #(Y11)

#--------------------------  Test Code  --------------------------------
package main;

my $x = X->new(1);                                                 #(T1)
my $y = Y->new(1);                                                 #(T2)
$x->setYfield( $y );                                               #(T3)
$y->setXfield( $x );                                               #(T4)

#print "before weakening: ", $x->{yobj}, "\n";                     #(T5)
weaken( $x->{yobj} );                                              #(T6)
#print "after weakening: ", $x->{yobj}, "\n";                      #(T7)

$x = undef;                                                        #(T8)
$y = undef;                                                        #(T9)

while(1) {}                                                       #(T10)
