#!/usr/bin/perl -w
use strict;

### TestNetwork3.pl

use Network;                                                        #(A)
use Node;                                                           #(B)

my $net = Network->new();                                           #(C)

$net->add_new_node( 100 );                                          #(D)
$net->add_new_node( 101 );                                          #(E)
$net->add_new_node( 102 );                                          #(F)

$net->link_nodes( 101, 102 );                                       #(G)

$net = undef;                                                       #(H)
             # Node of index 102 is about to be destroyed
             # Node of index 101 is about to be destroyed
             # Node of index 100 is about to be destroyed


while (1) {}                                                        #(I)
