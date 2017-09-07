#!/usr/bin/perl -w

### LibXmlSaxParser.pl

use strict;

#---------------------  MySAXEventHandler Class  ------------------------
package MySAXEventHandler;                                          #(H1)
use base qw(XML::SAX::Base);                                        #(H2)

sub start_document {                                                #(H3)
    my $self = shift;                                               #(H4)
    print "parsing started\n";                                      #(H5)
}

sub start_element {                                                 #(H6)
    my ($self, $element) = @_;                                      #(H7)
    print "start tag recognized for element: '$element->{Name}'\n"; #(H8)
    print "    LocalName: '$element->{LocalName}'\n";               #(H9)
    print "    Prefix:  '$element->{Prefix}'\n";                   #(H10)
    print "    NamespaceURI:  '$element->{NamespaceURI}'\n";       #(H11)
    if (%{$element->{Attributes}}) {                               #(H12)
        print "    Attributes:\n";                                 #(H13)
        while (my ($key, $val) = each %{$element->{Attributes}}){  #(H14)
            print "        $key: \n";                              #(H15)
            while ( my ($k, $v)   = each %$val ) {                 #(H16)
                print "            $k  =   $v\n";                  #(H17)
            }
            print "\n";
        }
        print "\n";
    }                                                              #(H18)
}                                          

sub characters {                                                   #(H19)
    my ($self, $characters) = @_;                                  #(H20)
    print "character handler invoked " .
          "for string: '$characters->{Data}'\n";                   #(H21)
}

sub end_element {                                                  #(H22)
    my ($self, $element) = @_;                                     #(H23)
    print "end tag recognized for element: '$element->{Name}'\n";  #(H24)
    print "    LocalName: '$element->{LocalName}'\n";              #(H25)
    print "    Prefix:  '$element->{Prefix}'\n";                   #(H26)
    print "    NamespaceURI:  '$element->{NamespaceURI}'\n";       #(H27)
}

sub end_document {                                                 #(H28)
    my $self = shift;                                              #(H29)
    print "parsing ended\n";                                       #(H30)
}

sub processing_instruction {                                       #(H31)
    my ($self, $pi) = @_;                                          #(H32)
    print "processing instruction recognized " .
          "for target '$pi->{Target}'\n";                          #(H33)
    print "    processing instruction data: '$pi->{Data}'\n";      #(H34)
}

sub comment {                                                      #(H35)
    my ($self, $comment) = @_;                                     #(H36)
    print "comment block recognized: '$comment->{Data}'\n";        #(H37)
}

sub start_cdata {                                                  #(H38)
    my $self = shift;                                              #(H39)
    print "start of CDATA section detected\n";                     #(H40)
}

sub end_cdata {                                                    #(H41)
    my $self = shift;                                              #(H42)
    print "end of CDATA section detected\n";                       #(H43)
}

#--------------------------  using the parser  --------------------------
package main;                                                       #(T1)

my $docname = shift;                                                #(T2)
die "Can't find \"$docname\"" unless -f $docname;                   #(T3)

use XML::LibXML::SAX;                                               #(T4)

my $parser = XML::LibXML::SAX->new(                   
               Handler => MySAXEventHandler->new() );               #(T5)

local $/ = undef;                                                   #(T6)
open( FILEIN, $docname );                                           #(T7)
my $doc = <FILEIN>;                                                 #(T8)

$parser->parse_string( $doc );                                      #(T9)
