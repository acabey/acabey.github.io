#!/usr/bin/perl -w
use strict;

### ClassMethods.pl

#-------------------------- class Robot -------------------------------
package Robot;                                                      #(A)

my $_robot_serial_num = 0;                                          #(B)
my $_next_serial =   sub { ++$_robot_serial_num };                  #(C)
my $_total_num   =   sub { $_robot_serial_num };                    #(D)

# Constructor:
sub new {                                                           #(E)
    my ( $class, $owner ) = @_;                                     #(F)
    bless {                                                         #(G)
        _owner => $owner,                                           #(H)
        _serial_number => $_next_serial->(),                        #(I)
    }, $class;                                                      #(J)
}

# This instance method can work both as a 'set' 
# and a 'get' method:
sub owner {                                                         #(K)
    my $self = shift;                                               #(L)
    @_ ? $self->{_owner} = shift                                    #(M)
       : $self->{_owner};                                           #(N)
}

# This is an instance method:
sub get_serial_num {                                                #(O)
    my $self = shift;                                               #(P)
    $self->{_serial_number};                                        #(Q)
}

# This is a class method:
sub how_many_robots {                                               #(R)
    my $class = shift;                                              #(S)
    die "illegal invocation of a static method"                     #(T)
        unless $class eq 'Robot';                                   #(U)
    $_total_num->();                                                #(V)
}

#-----------------------------------------------------------------------
#                           Test Code
#-----------------------------------------------------------------------
package main;

my $bot = Robot->new( "Zaphod" );                                   #(X)
my $name = $bot->owner();                                           #(Y)
my $num = $bot->get_serial_num();                                   #(Z)
print "robot owner: $name   serial number: $num\n";                 #(a)
                       # robot owner: Zaphod   serial number: 1

$bot = Robot->new( "Trillian" );                                    #(b)
$name = $bot->owner();                                              #(c)
$num = $bot->get_serial_num();                                      #(d)
print "robot owner: $name   serial number: $num\n";                 #(e)
                       # robot owner: Trillian   serial number: 2

$bot = Robot->new( "Betelgeuse" );                                  #(f)
$name = $bot->owner();                                              #(g)
$num = $bot->get_serial_num();                                      #(h)
print "robot owner: $name   serial number: $num\n";                 #(i)
                       # robot owner: Betelgeuse   serial number: 3

my $total_production = Robot->how_many_robots();                    #(j)
print "Total number of robots made: $total_production\n";           #(k)
                       # Total number of robots made: 3

my $x = Robot::how_many_robots();    #ERROR                         #(l)
