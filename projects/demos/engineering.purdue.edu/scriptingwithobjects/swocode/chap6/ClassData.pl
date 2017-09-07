#!/usr/bin/perl -w
use strict;

### ClassData.pl

#-------------------------- class Robot -------------------------------
package Robot;                                                      #(A)

# This is a class variable:
our $robot_serial_nums_used = 0;                                    #(B)

# Constructor:
sub new {                                                           #(C)
    my ( $class, $owner ) = @_;                                     #(D)
    bless {                                                         #(E)
        _owner => $owner,                                           #(F)
        _serial_number => $robot_serial_nums_used++,                #(G)
    }, $class;                                                      #(H)
}

# This is a class method:
sub how_many_robots {                                               #(I)
    my $class = shift;                                              #(J)
    die "illegal invocation of a static method"                     #(K)
        unless $class eq 'Robot';                                   #(L)
    $robot_serial_nums_used;                                        #(M)
}

#-----------------------    Test Code    -------------------------------
package main;

my $bot = Robot->new( "Zaphod" );                                   #(N)
$bot = Robot->new( "Trillian" );                                    #(O)

my $total_production = Robot->how_many_robots();                    #(P)
print "Total number of robots made: $total_production\n";           
                       # Total number of robots made: 2

# Directly accessing the class variable:
print $Robot::robot_serial_nums_used, "\n";     # 2                 #(Q)
