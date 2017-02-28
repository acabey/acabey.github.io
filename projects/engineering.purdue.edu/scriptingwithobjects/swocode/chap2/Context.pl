#!/usr/bin/perl -w                                           

## Context.pl

use strict;                                                  

my @friends = qw/ harry sally monica joe /;                        #(A)

#List context for the evaluation 
#of @friends; the items returned by 
#the evaluation are interpolated 
#into the list that is assigned to
#@arr
my @arr = (1, 2, 3, @friends, 4);                                  #(B)
print "@arr\n";                                                    #(C)
                                 # 1 2 3 harry sally monica joe 4 

#List context for @friends; will 
#print out the items one item after 
#another without any spaces in-between; 
#the output has the appearance of a 
#single string
print @friends, "\n";            # harrysallymonicajoe             #(D)

#List context for the evaluation 
#of @friends; for the purpose of 
#interpolation into the double-quoted 
#string, the items are separated
#by blank space
print "My friends: @friends\n";                                    #(E)
                                 # My friends: harry sally monica joe

#List context for @friends; the 
#items of the array @friends
#will be output one item after 
#another without any intervening
#spaces, giving the appearance of 
#a single string to the output
print "My friends: ", @friends, "\n";                              #(F)
                                 # My friends: harrysallymonicajoe

#Scalar context for @friends
my $num_friends = @friends;                                        #(G)
print $num_friends, "\n";        # 4                               #(H)

#Scalar context for @friends; the 
#scalar value returned will be a print
#representation of the scalar 
#evaluation of the array @friends
print "I have " . @friends ." friends\n";                          #(I)
                                 # I have 4 friends

#Scalar context for @friends
print "I have ", scalar @friends, " friends\n";                    #(J)
                                 # I have 4 friends

#Scalar context for the scalar 
#$friends[2]
print "My third friend is $friends[2]\n";                          #(K)
                                 # My third friend is monica

#List context for the scalar 
#$friends[2], but the list 
#consists of only one item which 
#is displayed as such (without 
#parentheses)
print "My third friend is ", $friends[2], "\n";                    #(L)
