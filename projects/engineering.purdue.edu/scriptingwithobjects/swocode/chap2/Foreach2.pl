#!/usr/bin/perl -w
use strict;

my @files = qw{/home/kak/perl/perl-run 
               /home/kak/perl/perl-functions};                        #(A)    

foreach my $file (@files) {                                           #(B)
    print "$file looks like a text file and is readable\n" if -r $file
                                                        && -T $file;  #(C)
}
