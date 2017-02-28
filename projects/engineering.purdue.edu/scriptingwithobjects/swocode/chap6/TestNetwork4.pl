#!/usr/bin/perl -w
use strict;

### TestNetwork4.pl

use Network;                                                        #(A)
use Node;                                                           #(B)

my $net = Network->new();                                           #(C)

$net->add_new_node( 100 );                                          #(D)
$net->add_new_node( 101 );                                   
$net->add_new_node( 102 );
$net->add_new_node( 103 );
$net->add_new_node( 104 );
$net->add_new_node( 105 );
$net->add_new_node( 106 );
$net->add_new_node( 107 );

$net->show_all_nodes();                                             #(E)
                     # 100 101 102 103 104 105 106 107
$net->link_nodes( 100, 102 );                                       #(F)
$net->link_nodes( 100, 104 );
$net->link_nodes( 104, 105 );
$net->link_nodes( 104, 106 );
$net->link_nodes( 100, 103 );
$net->link_nodes( 102, 103 );
$net->link_nodes( 104, 107 );

$net->list_links_for_one_node( 100 );                               #(G)
                     # Node 100 linked to: 102 104 103
$net->list_links_for_one_node( 104 );                               #(H)
                     # Node 104 linked to: 100 105 106 107
$net->list_links_for_one_node( 103 );                               #(I)
                     # Node 103 linked to: 100 102

$net->delete_node(100);                                             #(J)

print "after deleting node 100:\n";                                 #(K)

$net->show_all_nodes();                                             #(L)
                     # 101 102 103 104 105 106 107

#$net->list_links_for_one_node( 100 );                              #(M)
                     # node specified not in network; script 
                     # aborted at TestNetwork.pl line 58

$net->list_links_for_one_node( 104 );                               #(N)
                     # Node 104 linked to: 105 106 107
$net->list_links_for_one_node( 103 );                  
                     # Node 103 linked to: 102

$net->break_link(104, 107);                                         #(O)

print "After breaking 104 to 107 link:\n";                          #(P)

$net->list_links_for_one_node( 104 );                               #(Q)
                     # Node 104 linked to: 105 106
$net->list_links_for_one_node( 103 );
                     # Node 103 linked to: 102

while (1) {}
