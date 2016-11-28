#!/usr/bin/perl

# Hash.pl

# Bring a hash into existence by autovivification:
$h{a} = 100;                                                       #(A)
&display_hash( \%h );                    # a => 100                #(B)

# Initialize a hash with a list:
%h = ('a', 1, 'b', 2, 'c', 3);                                     #(C)
&display_hash( \%h );                    # c => 3                  #(D)
                                         # a => 1
                                         # b => 2
# Initialize a hash with a list using the big arrow notation:
%h = ( a => 1, 
       b => 2, 
       c => 3,
       d => 4);                                                    #(E)
&display_hash( \%h );                    # c => 3                  #(F)
                                         # a => 1
                                         # b => 2
                                         # d => 4
# Delete a key-value pair:
delete $h{c};                                                      #(G)
&display_hash( \%h );                    # a => 1                  #(H)
                                         # b => 2
                                         # d => 4
# Check for the existence of a key-value pair:
if ( exists $h{a} ) {                                              #(I)
    print "yes\n";                       # yes                     #(J)
}

# Retrieve all keys:
@keys = keys %h;                                                   #(K)
print "@keys\n";                         # a b d                   #(L)

# Retrieve all values:
@values = values %h;                                               #(M)
print "@values\n";                       # 1 2 4                   #(N)

# The keys() function in a scalar context:
$how_many_keys = keys %h;                                          #(O)
print "$how_many_keys\n";                # 3                       #(P)

# The values() function in a scalar context:
$how_many_values = values %h;                                      #(Q)
print "$how_many_values\n";              # 3                       #(R)

#$h{e};                                  # ERROR                   #(S)
#$h{f};                                  # ERROR                   #(T)

# Deleting a slice of the hash:
my @some_keys = qw/a b/;                                           #(U)
delete @h{@some_keys};                                             #(V)
&display_hash( \%h );                    # d => 4                  #(W)

# Inserting new (key, value) pairs as a hash slice:
my @new_keys = qw/e f/;                                            #(X)
@h{@new_keys} = (15, 16);                                          #(Y)
&display_hash( \%h );                    # e => 15                 #(Z)
                                         # d => 4
                                         # f => 16
#The display_hash subroutine:
sub display_hash {                                                 #(a)
    ($r) = @_;                                                     #(b)
    while ( ($name, $number ) = each %$r ) {                       #(c)
        print "$name => $number\n";                                #(d)
    }
}
