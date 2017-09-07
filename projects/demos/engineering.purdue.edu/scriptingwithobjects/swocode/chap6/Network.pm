package Network; 

### Network.pm

use strict;                                                         
use Carp;

my $in_net_predicate =                                             #(A1)
            sub {                                                  #(A2)
                my ($self, $node_index) = @_;                      #(A3)
                for my $node (@$self) {                            #(A4)
                    my $index = $node->get_index();                #(A5)
                    return 1 if $node_index == $index;             #(A6)
                }
                croak "node specified not in network;". 
                                      " script aborted";           #(A7)
            };


sub new {                                                          #(B1)
    croak "only no-arg constructor for Network" if @_ > 1;         #(B2)
    my $class = shift;                                             #(B3)
    my $_nodes = [];                                               #(B4)
    bless $_nodes, $class;                                         #(B5)
}

sub add_new_node {                                                 #(C1)
    my ($self, $index) = @_;                                       #(C2)
    for my $node (@$self) {                                        #(C3)
        if ($node->get_index == $index) {                          #(C4)
            print "A node with this index already exists.\n";      #(C5)
            return;                                                #(C6)
        }
    }
    push @$self, Node->new( $index );                              #(C7)
}

sub drop_node {                                                    #(D1)
    my ($self, $index) = @_;                                       #(D2)
    for my $node (@$self) {                                        #(D3)
        if ($node->get_index() == $index) {                        #(D4)
            $node = undef;                                         #(D5)
            last;                                                  #(D6)
        }
    }
    @$self = grep $_, @$self;                                      #(D7)
}

sub delete_node {                                                  #(E1)
    my ($self, $index) = @_;                                       #(E2)
    my $remove_node;                                               
    my @new_node_list;                                             
    for my $node (@$self) {                                        #(E4)
        push @new_node_list, $node if $node->get_index != $index;  #(E5)
        $remove_node = $node if $node->get_index == $index;        #(E6)
    }
    for my $node (@new_node_list ) {                               #(E7)
        $node->remove_node_from_links( $remove_node );             #(E8)
    }
    @$self = @new_node_list                                        #(E9)
}

sub show_all_nodes {                                               #(F1)
    my $self = shift;                                              #(F2)
    for my $node (@$self) {                                        #(F3)
        my $index = $node->get_index();                            #(F4)
        print "$index " if defined $index;                         #(F5)
    }
    print "\n";  
}

sub link_nodes {                                                   #(G1)
    my ($self, $node1_index, $node2_index) = @_;                   #(G2)
    &$in_net_predicate( $self, $node1_index );                     #(G3)
    &$in_net_predicate( $self, $node2_index );                     #(G4)
    # Get the Node objects for $node1_index and $node2_index 
    my ($node1, $node2);                                    
    for my $node (@$self) {                                        #(G5)
        $node1 = $node if $node->get_index() == $node1_index;      #(G6)
        $node2 = $node if $node->get_index() == $node2_index;      #(G7)
    }
    $node1->add_to_links( $node2 );                                #(G8)
    $node2->add_to_links( $node1 );                                #(G9)
}

# Break connection between any two nodes.  This
# has nothing to do with node deletion.
sub break_link {                                                   #(H1)
    my ($self, $node1_index, $node2_index) = @_;                   #(H2)
    &$in_net_predicate( $self, $node1_index );                     #(H3)
    &$in_net_predicate( $self, $node2_index );                     #(H4)
    my @new_links;                                 
    my ($node1, $node2);
    for my $node (@$self) {                                        #(H5)
        # Get hold of the Node objects:
        $node1 = $node if $node->get_index() == $node1_index;      #(H6)
        $node2 = $node if $node->get_index() == $node2_index;      #(H7)
    }
    $node1->remove_node_from_links( $node2 );                      #(H8)
    $node2->remove_node_from_links( $node1 );                      #(H9)
}

sub list_links_for_one_node {                                      #(I1)
    my ($self, $node_index) = @_;                                  #(I2)
    &$in_net_predicate( $self, $node_index );                      #(I3)
    for my $node (@$self) {                                        #(I4)
        my $index = $node->get_index();                            #(I5)
        if ($index == $node_index) {                               #(I6)
            my @linked_to = $node->get_links;                      #(I7)
            print "Node $node_index linked to: ";
            foreach my $linked_node (@linked_to) {                 #(I8)
                my $linked_node_index = $linked_node->get_index;
                print "$linked_node_index ";
            }
            print "\n";
        }
    }
}

sub DESTROY {                                                      #(J1)
    my $self = shift;                                              #(J2)
    for my $node (@$self) {                                        #(J3)
        $node->delete_all_links;                                   #(J4)
    }
}

1 
