#!/usr/bin/perl -w
use strict;

# TestEmployee.pl

use Employee;

my $emp1 = Employee->new( name   => "James", 
                          age    => 34, 
                          gender => "male", 
                          dept   => "fleet",
                          title  => "driver",
                          grade  => "junior");                      #(A)

print $emp1->get_name, "\n";             # James                    #(B)
print $emp1->get_age, "\n";              # 34                       #(C)
$emp1->set_age(35);                                                 #(D)
print $emp1->get_age, "\n";              # 35                       #(E)


my $emp2 = Employee->new( name   => "Poly", 
                          title  => "boss",
                          dept   => "fleet",
                          age    => 28, 
                          gender => "female", 
                          grade  => "junior");                      #(F)

print $emp2->get_name, "\n";             # Sally                    #(G)
print $emp2->get_title, "\n";            # boss                     #(H)
$emp2->set_grade("senior");                                         #(I)
print $emp2->get_grade, "\n";            # senior                   #(J)
