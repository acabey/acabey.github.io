#!/usr/bin/perl -w
use strict;

###  BlockDerypt.pl

use Bit::Vector;                                                     
use constant BLOCKSIZE => 64;                                        

die "Needs two command-line arguments for in file and out file" 
    unless @ARGV == 2;                                               

open FROM, shift @ARGV or die "unable to open filename: $!";         #(A)
open TO, ">" . shift @ARGV or die "unable to open filename: $!";     #(B)
open KEYFILE, "keyfile.txt";                                         #(C)
binmode( FROM );                                                     #(D)
binmode( TO );                                                       #(E)

chomp( my $permute_indices = <KEYFILE> );                            #(F)
my @permute_indices = split / /, $permute_indices;                   #(G)

while ( sysread( FROM, my $buff, BLOCKSIZE/8 ) ) {                   #(H)
    my $bitvec = Bit::Vector->new(BLOCKSIZE);                        #(I)
    $bitvec->Block_Store( $buff );                                   #(J)
    my @data_arr = split //, $bitvec->to_Bin();                      #(K)

    my @decrypted = unpermute( \@data_arr, \@permute_indices );      #(L)

    my $decrypted_bit_string = join "", @decrypted;                  #(M)
    my $out_vector = Bit::Vector->new_Bin(BLOCKSIZE, 
                                        $decrypted_bit_string);      #(N)
    my $out_buff = $out_vector->Block_Read();                        #(O)
    syswrite( TO, $out_buff, BLOCKSIZE/8 );                          #(P)
}
 
sub unpermute {
    my $ref1 = shift;          # ref to the array to be unpermuted   #(Q)
    my $ref2 = shift;          # ref to the permutation array        #(R)
    my @data_arr = @$ref1;                                           #(S)
    my @permute_arr = @$ref2;                                        #(T)
    my @unpermuted_output;                                           #(U)
    for my $i (0..$#permute_arr) {                                   #(V)
        $unpermuted_output[ $permute_arr[$i] ] = $data_arr[$i];      #(W)
    }
    return @unpermuted_output;                                       #(X)
}
