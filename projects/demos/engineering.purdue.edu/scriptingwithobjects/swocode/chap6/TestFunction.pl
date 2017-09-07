#!/usr/bin/perl -w
use strict;

### TestFunction.pl

use Function;                                                       #(A)

my $file = "func.c";                                                #(B)
open FILE, $file                                                    #(C)
       or die "unable to open filename: $!";                        #(D)
chomp( my @all_lines = <FILE> );                                    #(E)
my @functions_with_data = extract_functions(@all_lines);            #(F)
@functions_with_data = map { "$_ $file"} @functions_with_data;      #(G)
#print "@functions_with_data\n";

my @objects = ();                                                   #(H)
foreach (@functions_with_data) {                                    #(I)
    /^(.*\s+\*?)(\w+)\s(\d+)\s(\w+\.\w+)$/;                         #(J)
    push @objects, Function->new( $2, $1, $4, $3 );                 #(K)
}

for my $i (0..$#objects) {                                          #(L)
    print $objects[$i]->get_name() . " " .                          #(M)
          $objects[$i]->get_ret_type() . " " .
          $objects[$i]->get_line_num() . " " .                      #(N)        
          $objects[$i]->get_file() . "\n";                          #(N)
    $i++;                                                           #(O)
}

sub extract_functions {                                             #(P)
    my @all_lines = @_;                                             #(Q)
    my $regex = '^((?:struct\s+)?\w+\s+\*?\s*\w+)\s*\(.*\).*\{';    #(R)
    my @functions = map {/$regex/; $1} @all_lines;                  #(S)
    my $index = 0;                                                  #(T)
    @functions = map {$index++; "$_ $index" if defined $_} 
                                                     @functions;    #(U)
    @functions = grep $_, @functions;                               #(V)
    return @functions;                                              #(W)
}
