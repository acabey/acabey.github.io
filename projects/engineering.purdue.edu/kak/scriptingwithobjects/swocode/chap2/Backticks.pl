#!/usr/bin/perl -w

### Backticks.pl

use strict;

my $result_string = `uname -a`;                                    #(A)

my ($os_name, $host_name, $os_version) =                    
                                split / /, $result_string;         #(B)

print "Operating System: $os_name \n" .
      "Host Name: $host_name      \n" .
      "OS Version: $os_version    \n";                             #(C)

my $usr_name = 'kak';                                              #(D)
my @all_lines = `ls *txt; ps -j -U $usr_name`;                     #(E)

chomp( my @all = map {$_ =~ s/^\s*(.+)/$1/; $_} @all_lines );      #(F)

print join "\n", grep /\b$$\b/, @all;                              #(G)
            #  PID   PGID   SID  TTY       TIME      CMD
            # 30398 30398  2976 pts/2    00:00:00 Backticks.pl
            # 30400 30398  2976 pts/2    00:00:00 sh
            # 30402 30398  2976 pts/2    00:00:00 ps
