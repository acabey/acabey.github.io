#!/usr/bin/perl -w
use strict;

###  TestSuper.pl

package main;
use Worker;
use Foreman;

my ($position, $dept);

my $worker = Worker->new( "Joe", "shop_floor" );                   #(T1)
$worker->promote();                                                #(T2)
$position = $worker->get_position();   
print "$position\n";              # team_leader

my $forman = Foreman->new( "Amanda", "foreman", "assembly" );      #(T3)
$forman->print();                 # Amanda forman assembly
$forman->promote();                                                #(T5)
$forman->print();                 # Amanda manager assembly
$forman->promote(); # A foeman cannot be promoted beyond 'Manager' #(T7)
