#!/usr/bin/perl -w

### System.pl

use strict;

my $exit_status = system( 'ps -j -U kak  > temp' );                #(A)
print "$exit_status\n";                             # 0           

print $$, "\n";                                     # 12716        #(B)
print getpgrp $$, "\n";                             # 12716        #(C)

open IN, "temp";                                                   #(D)
my @all = map {$_ =~ s/^\s*(.+)/$1/; $_} <IN>;                     #(E)
chomp @all;                                                        #(F)

print join "\n", grep /\b$$\b/, @all;                              #(G)
              #  PID   PGID   SID  TTY       TIME      CMD
              # 12716 12716  2976  pts/2    00:00:00  System.pl
              # 12717 12716  2976  pts/2    00:00:00  sh
              # 12718 12716  2976  pts/2    00:00:00  ps

print "\n\n";

my @group_leaders;                                                 #(H)
my @session_leaders;                                               #(I)

for (1..$#all) {                                                   #(J)
    my @arr = split /\s+/, $all[$_];                               #(K)
    #Is PID the same as GID?
    if ($arr[0] == $arr[1]) {                                      #(L)
        push @group_leaders, $arr[0];                              #(M)
    }
    #Are PID, GID, and SID the same?
    if ($arr[0] == $arr[1] && $arr[1] == $arr[2]) {                #(N)
        push @session_leaders, $arr[0];                            #(O)
    }
}

#Sort group leader PID's (ascending order):
@group_leaders = sort {$a <=> $b} @group_leaders;                  #(P)

#Sort session leader PID's (ascending order):
@session_leaders = sort {$a <=> $b} @session_leaders;              #(Q)

print "Group leaders: @group_leaders\n\n";                         #(R)
             # Group leaders: 2526 2585 2820 2931 2934 2976 3017 \
             # 3371 3627 7223 7265 12716 19577 20128 20647 20757 \ 
             # 21111 21562 27149 29501 31205 31566 31756

print "Session leaders: @session_leaders\n\n";                     #(S)
             # Session leaders: 2585 2820 2931 2934 2976 3371 \
             # 7223 19577 20128 20647 20757 21111 27149 31756

#Form group leaders set:
my %group_leaders = map { $_ => 1 } @group_leaders;                #(T)

#Form session leaders set:
my %session_leaders = map { $_ => 1 } @session_leaders;            #(U)

#Form intersection set:
my %common_leaders = map { $_ => 1 } 
               grep { $session_leaders{$_} } keys %group_leaders;  #(V)

my @common_leaders = sort {$a <=> $b} keys %common_leaders;        #(W)

print "Group leaders that are also session " .
                              "leaders: @common_leaders\n\n";      #(X)

             # Group leaders that are also session leaders: 2585 \
             # 2820 2931 2934 2976 3371 7223 19577 20128 20647   \
             # 20757 21111 27149 31756

my @diff_array =  
      grep { ! exists $session_leaders{$_} } keys %group_leaders;  #(Y)

print "Group leaders that are NOT session leaders: @diff_array\n"; #(Z)
             # Group leaders that are NOT session leaders: 12716 \
             # 21562 2526 31566 3627 31205 29501 7265 3017
