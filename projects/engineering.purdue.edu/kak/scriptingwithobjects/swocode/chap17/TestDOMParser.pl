#!/usr/bin/perl -w

### TestDOMParser.pl

use SimpleDOMParser;                                                #(T1)

my $docname = shift;                                                #(T2)    
die "Can't find \"$docname\"" unless -f $docname;                   #(T3)

my $parser = SimpleDOMParser->new();                                #(T4)

$parser->parse($docname);                                           #(T5)

$parser->showAllElements();                                         #(T6)

my $n = $parser->countElements();                                   #(T7)
print "\nNumber of elements: $n\n";                                 #(T8)

$parser->displayDOMTree();                                          #(T9)

$parser->searchElementsForString( "hello" );                       #(T10)
