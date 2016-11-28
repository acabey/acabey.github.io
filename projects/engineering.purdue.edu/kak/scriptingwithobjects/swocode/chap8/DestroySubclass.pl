#!/usr/bin/perl -w
use strict;

###  DestroySubclass.pl

#--------------------------  Class Animal ----------------------------
package Animal;                                           

sub new {                                                 
    my ( $class, $name, $weight ) = @_;                 
    bless {                                         
        _name   => $name,   
        _weight => $weight,                       
    }, $class;
}

sub get_name {
    my $self = shift;
    $self->{_name};
}

sub DESTROY {                                                       #(A)
    my $self = shift;
    my $name = $self->get_name();
    print "Memory occupied by the Animal instance named " .
	"$name is about to be reclaimed\n";
}

#-----------------------  Class FourLegged  ---------------------------
package FourLegged;                                           

@FourLegged::ISA = ("Animal");                            

sub new {                                                
    my ( $class, $name, $weight, $num_of_teeth ) = @_;
    bless {
        _name   =>  $name,
        _weight =>  $weight,
        _num_of_teetch => $num_of_teeth,
    }, $class;
}

#------------------------  Test Code  ---------------------------------
package main;
my $anim = Animal->new( "BigHorn", "300" );                         #(B)
$anim = undef;                                                      #(C)
        # Memory occupied by the Animal instance named BigHorn 
        #                    is about to be reclaimed
my $pet = FourLegged->new( "PuttyCat", 15, 16 );                    #(D)
        # Memory occupied by the Animal instance named PuttyCat
        #                    is about to be reclaimed
