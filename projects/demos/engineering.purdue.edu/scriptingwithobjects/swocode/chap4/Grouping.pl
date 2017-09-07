#!/usr/bin/perl -w
  
## Grouping.pl    

use strict;       

# Demonstrate using match variables:
my $pattern = 'ab(cd|ef)(gh|ij)';                                   #(A)
my $input_string = "abcdij";                                        #(B)
$input_string =~ /$pattern/;                                        #(C)
print "$1 $2\n";                 # cd ij                            #(D)

$pattern = '(hi|hello) there(,|!) how are (you|you all)';           #(E)
$input_string = "hello there, how are you.";                        #(F)
my @vars = ($input_string =~ /$pattern/);                           #(G)
print "@vars\n";                 # hello , you                      #(H)

# Demonstrate using backreferences:
$pattern = '((a|i)(l|m))\1\2';                                      #(I)
@ARGV = '/usr/share/dict/words';                                    #(J)
while (<>) {                                                        #(K)
    print if /$pattern/;                                            #(L)
}
# output of while loop:
#                                balalaika
#                                balalaikas
