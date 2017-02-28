package XArray;                                                     #(A)

### XArray.pm

use strict;                      
use Carp;

# Import 'overload' and declare the operators that will be overloaded
use overload '+'   => '_add',                                       
             '""'  => '_str',
             '<<'  => '_left_shift',
             '~'   => '_invert',
             '<=>' => '_compare',
             'cmp' => '_compare',
             'fallback' => 1;                                      #(B)

# Constructor
sub new {                                                           #(C)
    my ($class, $arr_ref) = @_;                              
    bless {                                                  
        _arr => $arr_ref,                                    
        _size  => scalar( @$arr_ref ),                       
    }, $class;                                               
}                                                            

# Return the number of elements in an instance of XArray:
sub get_size { $_[0]->{_size}; }                                    #(D)

# Allow automatic conversion to a string representation:
sub _str {                                                          #(E)
    my $self = shift;
    return join("_", @{$self->{_arr}});
}

# Gives meaning to the 'x + y' operation:
sub _add {                                                          #(F)
    my ($x1, $x2) = @_;
    croak "Abort: The second arg object is not of type XArray" 
            unless UNIVERSAL::isa( $x2, 'XArray');
    my $size1 = $x1->get_size();
    my $size2 = $x2->get_size();
    croak "Aborted: two operands of unequal size in _add" 
                      if $size1 != $size2;                          #(G)
    my @result;
    while ($size1--) {                                              #(H)
        my $i = ++$#result;
        croak "Aborted: ummatched element types for '+' operation" 
            if $x1->{_arr}[$i] =~ /^\d+$/  != 
               $x2->{_arr}[$i] =~ /^\d+$/;                          #(I)
        $result[$i] =  $x1->{_arr}[$i] =~ /^\d+$/ ?
                           $x1->{_arr}[$i] + $x2->{_arr}[$i] :
                           $x1->{_arr}[$i] . $x2->{_arr}[$i];       #(J)
    }
    return XArray->new( \@result );                                 #(K)
}

# Give meaning to the 'x << a' operation:
sub _left_shift {                                                   #(L)
    my ($self, $pos) = @_;
    while ($pos--) {
        _left_shift_by_one( $self );
    }
}

# Used by the _left_shift() method:
sub _left_shift_by_one {                                            #(M)
    my $self = shift;
    my $first = shift @{$self->{_arr}};
    push @{$self->{_arr}}, $first;
}

# Given meaning to the negation operation as in '-x':
sub _invert {                                                       #(N)
    my $self = shift;
    my @result;
    @result = map( {/^\d+/ ? -$_ : join("",reverse(split(//,$_)))} 
                   @{$self->{_arr}} );                              #(O)
    return XArray->new( \@result );
}

# For three-valued comparison of XArray objects:
sub _compare {                                                      #(P)
    my ($x1, $x2) = @_;
    croak "Abort: The second arg object is not of type XArray" 
            unless UNIVERSAL::isa( $x2, 'XArray');
    my $size1 = $x1->get_size();
    my $size2 = $x2->get_size();
    croak "Aborted: cannot compare two operands of unequal size" 
                      if $size1 != $size2;                          #(Q)
    my @compare;
    foreach my $i (0..$size1-1) {                                   #(R)
        croak "Aborted: ummatched element types in the container" 
            if $x1->{_arr}[$i] =~ /^\d+$/  != 
               $x2->{_arr}[$i] =~ /^\d+$/;                          #(S)
        if ( $x1->{_arr}[$i] =~ /^\d+$/ ) {                         #(T)
            $compare[$i] = -1 if $x1->{_arr}[$i] < $x2->{_arr}[$i];
            $compare[$i] =  1 if $x1->{_arr}[$i] > $x2->{_arr}[$i];
            $compare[$i] =  0 if $x1->{_arr}[$i] == $x2->{_arr}[$i];
        } else {                                                    #(U)
            $compare[$i] = -1 if $x1->{_arr}[$i] lt $x2->{_arr}[$i];
            $compare[$i] =  1 if $x1->{_arr}[$i] gt $x2->{_arr}[$i];
            $compare[$i] =  0 if $x1->{_arr}[$i] eq $x2->{_arr}[$i];
        }
    }
    if ($compare[0] == -1) {                                        #(V)
        foreach my $i (0..$#compare){
            return 0 if -1 != $compare[$i];
        }
        return -1;                                                  #(W)
    } elsif ($compare[0] == 1) {                                    #(X)
        foreach my $i (0..$#compare){
            return 0 if 1 != $compare[$i];
        }
        return 1;                                                   #(Y)
    } else {
        return 0;                                                   #(Z)
    }
}

1
