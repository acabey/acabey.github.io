#!/usr/bin/perl -w
use strict;

#  AoA.pl

my $ref = [ [1, 2, 3], ['a', 'b', 'c'], ['hello', 'jello'] ];          #(A)

my @arr = ( [4, 5, 6], ['d', 'e'], ['mello', 'yello'] );               #(B)

# Dereferencing to retrieve the whole array
print "@$ref\n";  # ARRAY(0x804b514) ARRAY(0x805c3f4) ARRAY(0x805c430) #(C)
print "@arr\n";   # ARRAY(0x805704c) ARRAY(0x805c4a8) ARRAY(0x805c4d8) #(D)

# Dereferencing to retrieve a single element from
# an interior array of the named outer array
print ${$arr[1]}[1], "\n";               # e                           #(E)
print $arr[1]->[1], "\n";                # e                           #(F)
print $arr[1][1], "\n";                  # e                           #(G)

# Dereferencing to retrieve a single element from
# an interior array of the anonymous outer array
print ${${$ref}[1]}[1], "\n";            # b                           #(H)
print ${$ref}[1]->[1], "\n";             # b                           #(I)
print ${$ref}[1][1], "\n";               # b                           #(J)
print $ref->[1]->[1], "\n";              # b                           #(K)
print $ref->[1][1], "\n";                # b                           #(L)

# Dereferencing to retrive an interior array
my @arr_interior = @{$ref->[1]};                                       #(M)
print "@arr_interior\n";                 # a b c                       #(N)
