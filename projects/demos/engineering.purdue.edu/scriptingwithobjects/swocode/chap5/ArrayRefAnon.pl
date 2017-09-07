#!/usr/bin/perl -w
use strict;

#  ArrayRefAnon.pl

# Constructing an anonymous array
my $ref = [1, 2, 3];                                                   #(A)

# Constructing a named array
my @arr = (1, 2, 3);                                                   #(B)

# Dereferencing to retrieve the whole array
print "@$ref\n";                         # 1 2 3                       #(C)
print "@{$ref}\n";                       # 1 2 3                       #(D)

# Comparison with a named array
print "@arr\n";                          # 1 2 3                       #(E)

# Dereferencing to retrieve an individual element
print $$ref[1], "\n";                    # 2                           #(F)
print ${$ref}[1], "\n";                  # 2                           #(G)

# Comparison with a named array
print $arr[1], "\n";                     # 2                           #(H)

# Dereferencing with the arrow operator
print $ref->[1], "\n";                   # 2                           #(I)

# Comparison with a named array
print @arr->[1], "\n";                   # 2                           #(J)

push @$ref, 4;                                                         #(K)
print "@$ref\n";                         # 1 2 3 4                     #(L)

pop @$ref;                                                             #(M)
push @$ref, $ref;                                                      #(N)
print "@$ref\n";                         # 1 2 3 ARRAY(0x804b514)      #(O)

my @r1 = \("hello", "yello", "jello", "mello" );                       #(P)
print $r1[0], "\n";                      # SCALAR(0x805bde4)           #(Q)
print ${$r1[0]}, "\n";                   # hello                       #(R)
