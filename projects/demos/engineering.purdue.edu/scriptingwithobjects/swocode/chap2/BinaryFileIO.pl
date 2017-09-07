#!/usr/bin/perl -w

### BinaryFileIO.pl

use strict;

die "Needs one command-line argument" unless @ARGV == 1;           #(A)

open FILEIN, shift @ARGV or die "unable to open filename: $!";     #(B)
open FILEOUT, ">out" or die "unable to open filename: $!";         #(C)
open FILEDUMP, ">out.hex" or die "unable to open filename: $!";    #(D)

my $byte;
while ( sysread FILEIN, $byte, 1 ) {                               #(E)
    print "\$byte value is: $byte\n";
#    my $str = sprintf "%*vb", " ", $byte;                          #(F)
    my $str = sprintf "%vb", $byte;                          #(F)
    print "\$str value is: $str\n";    
    my $x = bin2dec( $str );                                       #(G)
    printf FILEDUMP "%x ", $x;                                     #(H)
    my $bin = pack("I", $x);                                       #(I)
    syswrite FILEOUT, $bin, 1;                                     #(J)
}

#From "Perl Cookbook" 
sub bin2dec {                                                      #(K)
    return unpack("N", pack("B32", substr("0" x 32 . shift, -32)));#(L)
}

#From "Perl Cookbook"
sub dec2bin {                                                      #(M)
    my $str = unpack("B32", pack("N", shift));                     #(N)
    $str =~ s/^0+(?=\d)//;                                         #(O)
    return $str;                                                   #(P)
}
