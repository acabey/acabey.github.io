#!/usr/bin/perl -w
use strict;

my @files = qw{/home/kak/perl/perl-run 
               /home/kak/perl/perl-functions};                        #(A)    

foreach (@files) {                                                    #(B)
    print "$_ looks like a text file and is readable\n" if -r && -T;  #(C)
}
