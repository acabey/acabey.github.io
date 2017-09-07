#!/usr/bin/perl -w

### XMLParser.pl 

my $file = shift;                                                    #(A)     
die "Can't find file \"$file\"" unless -f $file;                     #(B)

use strict;                                                          #(C)
use XML::Parser;                                                     #(D)

# The call to 'new' returns an object 
# of type XML::Parse::Expat
my $parser = new XML::Parser( ErrorContext => 2 );                   #(E)

$parser->setHandlers( Start       =>    \&start_tag_handler,         #(F)
                      End         =>    \&end_tag_handler,
                      Char        =>    \&char_handler,
                      CdataStart  =>    \&cdata_start_handler,
                      CdataEnd    =>    \&cdata_end_handler,
                      Comment     =>    \&comment_handler,
                      Default     =>    \&default_handler,
                    );
eval {                                                               #(G)
    $parser->parsefile( $file );
};
if ($@) {                                                            #(H)
    print "error in the source file: $@\n";
} else {
    print "document well formed\n";
}

sub start_tag_handler {                                              #(I)
    my ($p, @data) = @_;
    my $ele = shift @data;
    my $line = $p->current_line;
    my $parent_ele = $p->current_element;
    my $depth = $p->depth;
    print "Line $line: start tag of the element '$ele' with \n" .
          "             the attribute data '@data' (start_tag_handler)\n";
    print "         Parent Element: $parent_ele  " if $parent_ele;
    print "   Element Nesting Depth: $depth\n" if $depth > 0;
}

sub end_tag_handler {                                                #(J)
    my ($p, $ele) = @_;
    my $line = $p->current_line;
    print "Line $line: end tag of '$ele' element (end_tag_handler)\n";
}

sub char_handler {                                                   #(K)
    my ($p, $data) = @_;
    my $line = $p->current_line;
    if ($data eq "\n") { 
        print "Line $line: only '\\n' found (char handler)\n";
        return;
    }
    my $open_ele = $p->current_element;
    my $depth = $p->depth;
    $data =~ s/\s/\\s/g;
    print "Line $line: trapped '$data' (char handler)\n";
    print "          Open Element: '$open_ele' ".
          "    Element Nesting Depth: $depth\n";
}

# The CDATA content itself is not passed to this handler.  The 
# CDATA content triggers char events.
sub cdata_start_handler {                                            #(L)
    my $p = shift;
    my $line = $p->current_line;
    my $open_ele = $p->current_element;
    print "Line $line: CDATA section begins, Open Element: $open_ele ".
          "(cdata_start_handler)\n";
}

sub cdata_end_handler {                                              #(M)
    my $p = shift;
    my $line = $p->current_line;
    print "Line $line: end of CDATA section (cdata_end_handler)\n";
}

# Note that an entire comment will be delivered with a single 
# call to the handler.
sub comment_handler {                                                #(N)
    my ($p, $comment) = @_;
    my $line = $p->current_line;
    print "Line $line: comment block starts (comment handler)\n";
    print "          The comment is: $comment";
}

sub default_handler {                                                #(O)
    my ($p, $data) = @_;
    $data =~ s/[ ]/\\s/g;
    $data =~ s/\n/\\n/sg;
    my $line = $p->current_line;
    print "Line $line: default handler invoked for: $data\n";
}
