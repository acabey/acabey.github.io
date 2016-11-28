#!/usr/bin/perl -w
use strict;

# ShapeHierarchy.pl

#-------------------  Abstract Base Class Shape  -----------------------
package Shape;                                                      #(A)
use Carp;                                                           #(B)

sub new {                                                           #(C)
    croak "Shape is an abstract class.  No instances allowed:";
}

sub area { croak "No implementation provided. Illegal call:"; }     #(D)

sub circumference {                                                 #(E)
    croak "No implementation provided. Illegal call:";       
}

sub some_property {                                                 #(F)
    croak "No implementation provided. Illegal call:";       
}

#---------------------  Derived Class Circle  --------------------------
package Circle;                                                     #(G)
use Carp;

@Circle::ISA = qw(Shape);                                           #(H)

sub new {                                                           #(I)
    my ($class, $rad) = @_;
    my $r_circle = {
        radius => $rad,
    };
    bless $r_circle, $class;
    $r_circle;
}

sub area {                                                          #(J)
    my $circle = shift;
    my $radius = $circle->{radius};           
    3.14159 * $radius * $radius;
}

sub circumference {                                                 #(K)
    my $circle = shift;
    my $radius = $circle->{radius};
    2* 3.14159 * $radius;    
}

#-------------------  Derived Class Rectangle  -------------------------
package Rectangle;                                                  #(L)
use Carp;

@Circle::ISA = qw(Shape);                                           #(M)

sub new {                                                           #(N)
    my ($class, $height, $width) = @_;
    my $r_rect = {
        height => $height,
        width  => $width,
    };
    bless $r_rect, $class;
    $r_rect;
}

sub area {                                                          #(O)
    my $rect = shift;
    my $w = $rect->{width};
    my $h = $rect->{height};
    $w * $h;
}

sub circumference {                                                 #(P)
    my $rect = shift;
    my $w = $rect->{width};
    my $h = $rect->{height};
    2 * ( $w + $h );
}

#---------------------------  Test Code  -------------------------------   
package Test;

my $shape1 = Circle->new( 2.5 );                                    #(Q)
print $shape1->area(), "\n";                                        #(R)
print $shape1->circumference(), "\n";                               #(S)
#$shape1->some_property();               # ERROR                    #(T)

my $shape2 = Rectangle->new(3, 4 );                                 #(U)
print $shape2->area(), "\n";                                        #(V)
print $shape2->circumference(), "\n";                               #(W)
#$shape2->some_property();               # ERROR                    #(X)

#my $shape = Shape->new();               # ERROR                    #(Y)
