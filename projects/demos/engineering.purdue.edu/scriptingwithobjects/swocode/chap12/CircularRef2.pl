#!/usr/bin/perl -w

### CircularRef2.pl

use strict;

use Scalar::Util qw( weaken );

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

my $i = 0;                                                         #(T1)
#while ($i < 3) {                                                  #(T2)
while ($i < 100000) {                                              #(T3)
    my $x = X->new($i);                                            #(T4)
    my $y = Y->new($i);                                            #(T5)
    $x->setYfield( $y );                                           #(T6)
    $y->setXfield( $x );                                           #(T7)
    weaken( $x->{yobj} );                                          #(T8)
    $i++;                                                          #(T9)
}                                                                 #(T10)

print "\n\nDONE WITH THE WHILE LOOP\n\n";                         #(T11)
