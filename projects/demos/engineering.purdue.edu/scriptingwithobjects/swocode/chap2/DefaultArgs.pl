#!/usr/bin/perl -w

### DefaultArgs.pl

use strict;
use Carp;

our ($name, $age, $gender, $position);                              #(A)

my $position_default = 'Staff';                                     #(B)

sub setUserInfo {                                                   #(C)
    ($name, $age, $gender, $position) = @_;                         #(D)
    croak "illegal call --- must supply name" if !defined $name;    #(E)
    $age = 'unknown' if !defined $age;                              #(F)
    $gender = 'unknown' if !defined $gender;                        #(G)
    $position = $position_default if !defined $position;            #(H)
}

$position_default = 'MemberStaff';                                  #(I)

setUserInfo( 'Trillian', 96, 'female' );                            #(J)
print "$name $age $gender $position\n";                             #(K)
                     # Trillian 96 female MemberStaff

setUserInfo( 'Trillian', 96 );                                      #(L)
print "$name $age $gender $position\n";                             #(M)
                     # Trillian 96 unknown MemberStaff                     

setUserInfo( 'Trillian' );                                          #(N)
print "$name $age $gender $position\n";                             #(O)
                     # Trillian unknown unknown MemberStaff

setUserInfo();                                                      #(P)
        # illegal call --- must supply name at DefaultArgs.pl line 16
        # main::setUserInfo() called at DefaultArgs.pl line 35
