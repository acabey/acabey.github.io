#!/usr/bin/perl -w

### TestPerson.pl

use strict;                                                         #(A)

use Person;                                                         #(B)

my ($person, $name, $age);                                          #(C)

#$person = new Person( "Zahpod", 114 );  

#$name = get_name $person;

#print $name, "\n";

#print $person->get_name, "\n";

#$person->name( "Trillian" );

$person = Person->new( "Zahpod", 114 );                             #(D)
#$person = Person::new('Person', "Zahpod", 114 );  
#$name = $person->name;                 
$name = $person->get_name;                                          #(E)
#$name = Person::name($person);       
#$age = $person->age;           
$age = $person->get_age;                                            #(F)
print "name: $name   age: $age\n";      # name: Zaphod   age: 114   #(G)

#$person->age(214);               
$person->set_age(214);                                              #(H)
#Person::age( $person, 214 );      
#$age = $person->age;                 
$age = $person->get_age;                                            #(I)
print "name: $name   age: $age\n";      # name: Zaphod   age: 214   #(J)

#$person->name( "Trillian" );
