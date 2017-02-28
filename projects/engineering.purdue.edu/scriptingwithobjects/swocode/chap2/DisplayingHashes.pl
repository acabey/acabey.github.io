#!/usr/bin/perl -w

# DisplayingHashes.pl

use strict;       

my %hash = (a => 11, b => 12, c => 13 );                            #(A)

print "%hash\n";                        # %hash (NOT WHAT YOU WANT) #(B)

print %hash;                            # c13a11b12                 #(C)
print "\n";

print %hash, "\n";                      # c13a11b12                 #(D)

print %hash . "\n";                     # 3/8                       #(E)

print "$hash{b}\n";                     # 12                        #(F)

print keys %hash, "\n";                 # cab                       #(G)
#print keys %hash . "\n";               # ERROR                     #(H)
print values %hash, "\n";               # 131112                    #(I)
#print values %hash . "\n";             # ERROR                     #(J)

print keys(%hash), "\n";                # cab                       #(K)
print keys(%hash) . "\n";               # 3                         #(L)
print values(%hash), "\n";              # 131112                    #(M)
print values(%hash) . "\n";             # 3                         #(N)

print scalar keys %hash, "\n";          # 3                         #(O)
print scalar values %hash, "\n";        # 3                         #(P)

# For printing out each (key, value) pair in a separate line:
while ( my ($k, $v ) = each %hash) {                                #(Q)
    print "$k => $v\n";                                             #(R)
}                                       # c => 13
                                        # a => 11
                                        # b => 12

# Another way to print out each (key, value) pair in a separate line:
foreach my $kee ( keys %hash ) {                                    #(S)
    if ( exists $hash{$kee} ) {                                     #(T)
        print "$kee => $hash{$kee}\n";                              #(U)
    } else {                                                        #(V)
        print "NO ENTRY FOR THIS KEY\n";                            #(W)
    }
}                                       # c => 13
                                        # a => 11
                                        # b => 12

# Yet another way to iterate over a hash:
my @keys = keys %hash;                                              #(X)
my @values = values %hash;                                          #(Y)
while (@keys) {                                                     #(Z)
    print pop(@keys), ' => ', pop(@values), "\n";                   #(a)
}                                       # b => 12
                                        # a => 11
                                        # c => 13

# Iterating over a hash in a key-sorted manner:
foreach my $key (sort(keys %hash)) {                                #(b)
    print $key, ' => ', $hash{$key}, "\n";                          #(c)
}                                       # a => 11
                                        # b => 12
                                        # c => 13

# Iterating over a hash in a value-sorted manner:
foreach my $key (sort { $hash{$b} <=> $hash{$a} } keys %hash) {     #(d)
    printf "%2d <= %s\n", $hash{$key}, $key;                        #(e)
}                                       # 13 <= c
                                        # 12 <= b
                                        # 11 <= a

# Iterating over a hash in a case-insensitive key-sorted manner:
%hash = qw( cat 1 CAT 2 DOG 3 dog 4 );                              #(f)
foreach my $key (sort { "\L$a" cmp "\L$b" } keys %hash) {           #(g)
    printf "%s => %s\n", $key, $hash{$key};                         #(h)
}                                       # CAT => 2
                                        # cat => 1
                                        # dog => 4
                                        # DOG => 3
