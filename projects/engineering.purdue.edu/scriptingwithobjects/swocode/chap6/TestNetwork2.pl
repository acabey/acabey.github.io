#!/usr/bin/perl -w
use strict;

### TestNetwork2.pl

use Network;                                                        #(A)
use Node;                                                           #(B)

my $net = Network->new();                                           #(C)

$net->add_new_node( 100 );                                          #(D)
$net->add_new_node( 101 );                                          #(E)
$net->add_new_node( 102 );                                          #(F)

$net->link_nodes( 101, 102 );                                       #(G)

$net->delete_node( 100 );                                           #(H)
$net->delete_node( 101 );                                           #(I)
$net->delete_node( 102 );                                           #(J)

while (1) {}                                                        #(K)
