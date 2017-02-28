#!/usr/bin/perl -w
use strict;

### TestPersonHierarchy.pl

package main;                                                       #(T1)
use Manager;

my ($name, $age, $position, $dept);                                 #(T2)

my $emp = Employee->new( "Zaphod", 84, "shop_floor" );              #(T3)
print $emp->get_name(), "\n";          # Zaphod                     #(T4)
print $emp->get_age(), "\n";           # 84                         #(T5)
print $emp->get_position(), "\n";      # shop_floor                 #(T6)

$emp->promote();                                                    #(T7)
print $emp->get_position(), "\n";      # staff                      #(T8)

my $man = Manager->new( "Trillian", 42, "astt_manager", "sales" );  #(T9)
print $man->get_name(), "\n";          # Trillian                  #(T10)
print $man->get_age(), "\n";           # 42                        #(T11)
print $man->get_position(), "\n";      # astt_manager              #(T12)
print $man->get_department(), "\n";    # sales                     #(T13)
$man->promote();                                                   #(T14)
print $man->get_position(), "\n";      # manager                   #(T15)

$man->set_bonus( 1000 );                                           #(T16)
print $man->get_name(), ": ", $man->get_bonus(),"\n";              #(T17)
                          # Trillian: 1000
my $man2 = Manager->new( "Betelgeuse", 18, "staff", "sales" );     #(T18)
print $man2->get_name(), ": ", $man2->get_bonus(), "\n";           #(T19)
                          # Betelgeuse: 1000
$man2->set_bonus( 5555 );                                          #(T20)
print $man->get_name(), ": ", $man->get_bonus(), "\n";             #(T21)
                          # Trillian: 5555
print $man2->get_name(), ": ", $man2->get_bonus(), "\n";           #(T22)
                          # Betelgeuse: 5555
