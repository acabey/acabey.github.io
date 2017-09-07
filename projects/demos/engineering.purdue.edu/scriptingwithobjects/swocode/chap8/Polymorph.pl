#!/usr/bin/perl -w
use strict;

### Polymorph.pl

use Person;
use Employee;
use Manager;

sub foo {                        #  expects a Person argument       #(A)    
    my ($arg) = @_;                                      
    my $nam = $arg->get_name();                                     #(B)
    print "subroutine foo reporting: $nam\n";
}

my $per = Person->new( "Zaphod", 84 );                              #(C)

my $emp = Employee->new( "Orpheus", 84, "shop_floor" );             #(D)

my $man = Manager->new( "Trillion", 42, "astt_manager", "sales" );  #(E)

#foo invoked on a Person:
foo( $per );                          #Zahpod                       #(F)

#foo invoked on an Employee:
foo( $emp );                          #Orpheus                      #(G)

#foo invoked on a Manager:
foo( $man );                          #Trillian                     #(H)
