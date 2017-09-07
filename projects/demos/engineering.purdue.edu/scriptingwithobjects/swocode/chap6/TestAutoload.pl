#!/usr/bin/perl -w
use strict;

### TestAutoload.pl

#---------------------------  class Employee ---------------------------      
package Employee;                                           

# Constructor:
sub new {                                                 
    my ( $class, $name, $position ) = @_;                 
    bless { 
        _name =>  $name,   
        _position =>  $position 
    }, $class;                            
}

sub AUTOLOAD {                                                      #(A)
    my $self = shift;                                               #(B)
    if ( $Employee::AUTOLOAD =~ /::DESTROY/ ) {                     #(C)
        print "Looking for DESTROY but found AUTOLOAD\n";           #(D)
        return;
    }
    print "Employee's AUTOLOAD invoked by $Employee::AUTOLOAD\n";   #(E)
}

#---------------------     Test Code    --------------------------------
package main;

my $emp = Employee->new( "Orpheus", "staff" );                      #(F)

# Will trigger garbage collection of the object of line (F):   
$emp = undef;                                                       #(G)

$emp = Employee->new( "Zaphod", "staff" );                          #(H)

# Since get_position() not defined for Employee, the
# following call should go to AUTOLOAD():
$emp->get_position();                                               #(I)
