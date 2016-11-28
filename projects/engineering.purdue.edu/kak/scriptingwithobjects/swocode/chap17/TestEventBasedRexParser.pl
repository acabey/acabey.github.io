#!/usr/bin/perl -w

### TestEventBasedRexParser.pl

use EventBasedRexParser;                                            #(T1)

my $docname = shift;                                                #(T2)    
die "Can't find \"$docname\"" unless -f $docname;                   #(T3)

my $parser = EventBasedRexParser->new();                            #(T4)

$parser->setHandlers( StartTag => \&startTagHandler,
                      EndTag   => \&endTagHandler,
                      CharData => \&charHandler,
                    );

sub endTagHandler {
    my $tag_name = shift;
    print "end of element '$tag_name'\n";
}

sub startTagHandler { 
    my ($tag_name, $attributes) = @_;
    if ($attributes) {
        print "start of element '$tag_name' with attributes: ";
        foreach (keys %$attributes) {
            print "$_ => $attributes->{$_}  ";
        }
        print "\n";
    } else {
        print "start of element '$tag_name'\n";
    }
}

sub charHandler {
    my $string = shift;
    return if $string eq "\n";
    print "character data:  $string\n";
}

$parser->parse($docname);                              #(T5)
