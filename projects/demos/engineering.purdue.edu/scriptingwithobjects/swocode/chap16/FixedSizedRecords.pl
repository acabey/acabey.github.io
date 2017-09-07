#!/usr/bin/perl -w
use strict;

### FixedSizedRecords.pl

use constant RECORD_LEN => 32;                                       #(A)

# Create a small database of fixed-sized records:
open(FILE, ">data2.db");    # die stuff                              #(B)
print FILE pack( "a10 a10 a12","kak","avi","765-123-4567" );         #(C)
print FILE pack( "a10 a10 a12","smythe","stacey","765-234-6666" );   #(D)
print FILE pack( "a10 a10 a12","beeblecrox","zaphod","111-987-9988");#(E)
print FILE pack( "a10 a10 a12","skywalker","luke","4ZV 398 9999" );  #(F)
close FILE;                                                          #(G)

# Open the database for user interaction:

open(FILE, "+< data2.db") or die "unable to open file: $!";          #(H)
my ($buff, %names);                                                  #(I)

# Construct the list of all the last names:
for (my $i=0;;$i++) {                                                #(J)
    my $file_pointer = $i * RECORD_LEN;                              #(K)
    seek(FILE, $file_pointer, 0);                                    #(L)
    last unless read(FILE, $buff, 10);                               #(M)
    $buff =~ s/\0*$//;                                               #(N)
    $names{$buff} = $i;                                              #(O)
}

# User interaction:
while (1) {                                                          #(P)
    print "Last names of the individuals in the database:\n\n";      #(Q)
    print map "$_\n", sort keys %names;                              #(R)
    print "\nWhose record would you like to see? Enter last name: "; #(S)
    chomp( my $response = <STDIN> );                                 #(T)
    last unless exists $names{$response};                            #(U)
    my $row_index = $names{$response};                               #(V)
    seek(FILE, $row_index * RECORD_LEN, 0);                          #(W)
    read(FILE, $buff, 32);                                           #(X)
    my ($lname, $fname, $phone) = unpack( "a10 a10 a12", $buff );    #(Y)
    printf "\nHere it is:    %s\t%s\t%s\n", $lname, $fname, $phone;  #(Z)
    printf "\nEnter the old value you'd like to change: ";           #(a)
    chomp( my $old = <STDIN> );                                      #(b)
    printf "\nNow enter the new value: ";                            #(c)
    chomp( my $new = <STDIN> );                                      #(d)
    foreach ($lname, $fname, $phone) {                               #(e)
        last if s/$old/$new/;                                        #(f)
    }
    seek(FILE, $row_index * RECORD_LEN, 0);                          #(g)
    print FILE pack( "a10 a10 a12", $lname, $fname, $phone );        #(h)
}
