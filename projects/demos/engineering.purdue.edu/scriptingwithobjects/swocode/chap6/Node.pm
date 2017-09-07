package Node; 

### Node.pm

use strict;                                                         
use Carp;

sub new {                                                           #(A)
    my ($class, $index) = @_;                                       #(B)
    bless {                                                         #(C)
        _index => $index,                                           #(D)
        _linked_to => [],                                           #(E)
    }, $class;                                                      #(F)
}

sub get_index {                                                     #(G)
    my $self = shift;                                               #(H)
    return $self->{ _index };                                       #(I)
}

sub get_links {                                                     #(J)
    my $self = shift;                                               #(K)
    return @{$self->{_linked_to}};                                  #(L)
}

sub add_to_links {                                                  #(M)
    my ($self, $new_node) = @_;                                     #(N)
    push @{$self->{_linked_to}}, $new_node;                         #(O)
}

sub remove_node_from_links {                                        #(P)
    my ($self, $remove_node) = @_;                                  #(Q)
    my @new_links;                                                  #(R)
    for my $node ($self->get_links) {                               #(S)
        if ($node->get_index != $remove_node->get_index) {          #(T)
            push @new_links, $node;                                 #(U)
        }
    }
    $self->{_linked_to} = \@new_links;                              #(V)
}

sub delete_all_links {                                              #(W)
    my $self = shift;                                               #(X)
    $self->{_linked_to} = undef;                                    #(Y)
}

sub DESTROY {                                                       #(Z)
    my $self = shift;                                               #(a)
    my $index = $self->get_index;                                   #(b)
    print "Node of index $index is about to be destroyed\n";        #(c)
}

1
