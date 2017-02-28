#!/usr/bin/perl -w
  
## MultiLine.pl   

use strict;  

my $input_string = "abcd\nefgh\nijkl\n";                            #(A)

# CASE 1:
my $regex = 'abcd';                                                 #(B)
if ( $input_string =~ /$regex/ ) {                                  #(C)
    print "match successful\n";           # match successful        
} else {
    print "no success\n";
}

# CASE 2:
$regex = '^abcd$';                                                  #(D) 
if ( $input_string =~ /$regex/ ) {                                  #(E)
    print "match successful\n";           
} else {
    print "no success\n";                 # no success
}

# CASE 3:
$regex = '^ab.*kl$';                                                #(F)
if ( $input_string =~ /$regex/ ) {                                  #(G)
    print "match successful\n";           
} else {
    print "no success\n";                 # no success
}

# CASE 4:
$regex = '^ab.*kl$';                                                #(H)
if ( $input_string =~ /$regex/s ) {                                 #(I)
    print "match successful\n";           # match successful 
} else {
    print "no success\n";
}

# CASE 5:
$regex = '^abcd$';                                                  #(J)
if ( $input_string =~ /$regex/m ) {                                 #(K)
    print "match successful\n";           # match successful        
} else {
    print "no success\n";
}

# CASE 6:
$regex = '^ab.*kl$';                                                #(L)
if ( $input_string =~ /$regex/m ) {                                 #(M)
    print "match successful\n";           
} else {
    print "no success\n";                 #  no success
}

# CASE 7:
$regex = '^ab.*gh$';                                                #(N)
if ( $input_string =~ /$regex/sm ) {                                #(O)
    print "match successful\n";           # match successful  
} else {
    print "no success\n";
}

# CASE 8:
$regex = '\Aab.*kl\Z';                                              #(P)
if ( $input_string =~ /$regex/sm ) {                                #(Q)
    print "match successful\n";           # match successful 
} else {
    print "no success\n";
}
