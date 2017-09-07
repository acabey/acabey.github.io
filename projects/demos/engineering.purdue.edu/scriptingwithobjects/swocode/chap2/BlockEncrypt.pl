#!/usr/bin/perl -w
use strict;

###  BlockEcrypt.pl

use Bit::Vector;                                                     #(A)
use constant BLOCKSIZE => 64;                                        #(B)

die "Needs two command-line arguments for in file and out file"      #(C)
    unless @ARGV == 2;                                               #(D)

open FROM, shift @ARGV or die "unable to open filename: $!";         #(E)
open TO, ">" . shift @ARGV or die "unable to open filename: $!";     #(F)
open KEYFILE, "> keyfile.txt";                                       #(G)
binmode( FROM );                                                     #(H)
binmode( TO );                                                       #(I)

my @permute_indices = 0..BLOCKSIZE-1;                                #(J)
fisher_yates_shuffle( \@permute_indices );                           #(K)
print KEYFILE "@permute_indices";                                    #(L)

while (1){                                                           #(M)
    my $num_of_bytes_read = sysread( FROM, my $buff, BLOCKSIZE/8 );  #(N)
    if ($num_of_bytes_read < BLOCKSIZE/8) {                          #(O)
        $buff .= '0' x (BLOCKSIZE/8 - $num_of_bytes_read);           #(P)
    }
    my $bitvec = Bit::Vector->new(BLOCKSIZE);                        #(Q)
    $bitvec->Block_Store( $buff );                                   #(R)
    my @data_arr = split //, $bitvec->to_Bin();                      #(S)

    my @permuted_array = permute( \@data_arr, \@permute_indices );   #(T)
    my $permuted_bit_string = join "", @permuted_array;              #(U)
    my $out_vector = Bit::Vector->new_Bin(BLOCKSIZE, 
                                            $permuted_bit_string);   #(V)
    my $out_buff = $out_vector->Block_Read();                        #(W)
    syswrite( TO, $out_buff, BLOCKSIZE/8 );                          #(X)
    last if $num_of_bytes_read < BLOCKSIZE/8;                        #(Y)
}                                                                    #(Z)

sub fisher_yates_shuffle {                                           #(a)
    my $arr =  shift;                # ref to array to be shuffled   #(b)
    my $i = @$arr;                                                   #(c)
    while (--$i) {                                                   #(d)
        my $j = int rand( $i + 1 );                                  #(e)
        @$arr[$i, $j] = @$arr[$j, $i];                               #(f)
    }
}

sub permute {                                                        #(f)
    my $ref1 = shift;            # ref to the array to be permuted   #(g)  
    my $ref2 = shift;            # ref to the permutation array      #(h)
    my @data_arr = @$ref1;                                           #(i)
    my @permute_arr = @$ref2;                                        #(j)
    my @permuted_output;                                             #(k)
    for my $i (0..$#permute_arr) {                                   #(l)
        push @permuted_output, $data_arr[$permute_arr[$i]];          #(m)
    }                        
    return @permuted_output;                                         #(n)
}
