#!/usr/bin/perl -w
use strict;

use Baz;                                                           #(T1)

my $bz = Baz->new();                                               #(T2)
$bz->foo();                                                        #(T3)
$bz->bar();                                                        #(T4)
