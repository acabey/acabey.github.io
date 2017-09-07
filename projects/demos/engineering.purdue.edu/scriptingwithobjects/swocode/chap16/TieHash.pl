#!/usr/bin/perl -w
use strict;

###  TieHash.pl

use Fcntl;                                                           #(A)
use SDBM_File;                                                       #(B)

tie my %h, 'SDBM_File', 'my_database', O_RDWR|O_CREAT, 0640          #(C)
    or die "Cannot connect with the database: $!";                   #(D)

$h{ a } = 10;                                                        #(E)
$h{ b } = 20;                                                        #(F)
$h{ c } = 30;                                                        #(G)

while ( my ($key, $value) = each %h ) {                              #(H)
    print "$key ===>>> $value\n";                                    #(I)
}
                        #    a ===>>> 10
                        #    b ===>>> 20
                        #    c ===>>> 30
untie %h;                                                            #(J)

#  Test reading from the disk file named 'my_database'
tie my %g, 'SDBM_File', 'my_database', O_RDONLY, 0640                #(K)
    or die "Cannot connect with the database: $!";                   #(L)

while ( my ($key, $value) = each %g ) {                              #(M)
    print "$key --->>> $value\n";                                    #(N)
}
                        #    a --->>> 10
                        #    b --->>> 20
                        #    c --->>> 30
untie %g;                                                            #(O)
