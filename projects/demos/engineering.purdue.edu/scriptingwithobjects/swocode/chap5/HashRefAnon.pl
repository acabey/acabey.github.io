#!/usr/bin/perl -w
use strict;

#  HashRefAnon.pl

# Constructing an anonymous hash
my $ref = {d => 1, b => 2, c => 4};                                    #(A)

# Constructing a named hash
my %hash = (d => 1, b => 2, c => 4);                                   #(B)

# Dereferencing to retrieve the whole hash
print_hash_ref( $ref );         # b => 2  c => 4  d => 1               #(C)
# Comparison with a named hash
print_hash_ref( \%hash );       # b => 2  c => 4  d => 1               #(D)

# Dereferencing to retrieve an individual value
print $$ref{b}, "\n";           # 2                                    #(E)
print ${$ref}{b}, "\n";         # 2                                    #(F)
# Comparison with a named hash
print $hash{b}, "\n";           # 2                                    #(G)

# Dereferencing with the arrow operator
print $ref->{b}, "\n";          # 2                                    #(H)
# Comparison with a named hash
print %hash->{b}, "\n";         # 2                                    #(I)

# The delete() function invoked through a ref
delete $ref->{d};                                                      #(J)
# Comparison with a named hash
delete $hash{d};                                                       #(K)

# Setting interior value to a hash ref
$ref->{b} = {p => 7, q => ['r', 's']};                                 #(L)
print_hash_ref( $ref );         # b => HASH(0x805ddd0)  c => 4         
# Comparison with a named hash
$hash{b} = {p => 7, q => ['r', 's']};                                  #(M)
print_hash_ref( \%hash );       # b => HASH(0x805de2c)  c => 4         

# Retrieving an interior value with arrow 
print "$ref->{b}->{q}\n";       # ARRAY(0x805dcdc)                     #(N)
print "$ref->{b}{q}\n";         # ARRAY(0x805dcdc)                     #(O)
# Comparison with a named hash
print "$hash{b}->{q}\n";        # ARRAY(0x805de08)                     #(P)
print "$hash{b}{q}\n";          # ARRAY(0x805de08)                     #(Q)

# Retrieving an interior value with arrow 
print "$ref->{b}->{q}->[0]\n";  # r                                    #(R)
print "$ref->{b}{q}[0]\n";      # r                                    #(S)
# Comparison with a named hash
print "$hash{b}->{q}->[0]\n";   # r                                    #(T)
print "$hash{b}{q}[0]\n";       # r                                    #(U)


sub print_hash_ref {                                                   #(V)
    my $r = shift;                                                     #(W)
    while ( (my $key, my $value) = each %$r ) {                        #(X)
        print "$key => $value  ";                                      #(Y)
    }
    print "\n";
}
