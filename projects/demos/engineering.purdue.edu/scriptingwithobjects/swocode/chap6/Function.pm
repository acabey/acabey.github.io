package Function; 

### Function.pm

use strict;                                                         
use Carp;

sub new {                                                           #(A)
    my ($class, $name, $ret_type, $file, $line_num) = @_;           #(B)
    bless {                                                         #(C)
        _name       => $name     || croak("function name required"),#(D)
        _ret_type   => $ret_type || '????',                         #(E)
        _file       => $file     || '????',                         #(F)
        _line_num   => $line_num || '????', 
    }, $class;                                                      #(G)
}

sub get_name { $_[0]->{_name} }                                     #(H)
sub get_file { $_[0]->{_file} }                                     #(I)
sub get_ret_type { $_[0]->{_ret_type} }                             #(J)
sub get_line_num { $_[0]->{_line_num} }                             #(K)

sub set_name { $_[0]->{_name} = $_[1] }                             #(L)
sub set_ret_type { $_[0]->{_ret_type} = $_[1] }                     #(M)
sub set_file { $_[0]->{_file} = $_[1] }                             #(N)
sub set_line_num { $_[0]->{_line_num} = $_[1] }                     #(O)


sub DESTROY {                                                       #(P)
    my $record = join ' ', ($_[0]->{_name},                         #(Q)
                            $_[0]->{_file},                         #(R)
                            $_[0]->{_ret_type},                     #(S)
                            $_[0]->{_line_num});                    #(T)
    open FILE, '>> function_archive.txt';                           #(U)
    print FILE "$record\n";                                         #(V)
    close FILE;                                                     #(W)
}

1 
