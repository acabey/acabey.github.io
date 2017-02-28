package SimpleDOMParser;

### SimpleDOMParser.pm

use SimpleElement;                                                  #(P1)

# The root to the DOM tree is of type SimpleElement as defined in the
# the module of the same name.  This root becomes the value of the
# _rootDOMTree instance variable.  As elements are discovered, they
# are all stored away in the array whose reference is held by the
# instance variable _all_elements.
sub new {                                                           #(P2)
    my $class = shift;                                              #(P3)
    bless {                                                         #(P4)
        _documentName => undef,                                     #(P5)
        _rootDOMTree => undef,                                      #(P6)
        _all_elements => [],                                        #(P7)
    }, $class;                                                      #(P8)
}

sub showAllElements {                                               #(P9)
    my $self = shift;
    my @ele_names = map $_->getTagName, @{$self->{_all_elements}};
    print "\nELEMENT TYPES:  @ele_names\n";
}

sub countElements {                                                #(P10)
    my $self = shift;
    @{$self->{_all_elements}};
}

sub searchElementsForString {                                      #(P11)
    my ($self, $str) = @_;
    my @eles = grep {$_->getText =~ /$str/} @{$self->{_all_elements}};    
    my @ele_names = map $_->getTagName, @eles;
    if (@ele_names) {
       print "\nThe string \"$str\" found in the " .
             "following elements:  @ele_names\n";
   } else {
       print "\nThe string \"$str\" not found in any element\n";
   }
}

sub parse {                                                        #(P12)
    my ($self, $filename) = @_;                                    #(P13)
    $self->{_documentName} = $filename;                            #(P14)
    local $/ = undef;                                              #(P15)
    open FILEIN, $self->{_documentName};                           #(P16)
    my $document = <FILEIN>;                                       #(P17)
    # Get rid of newlines:   
    $document =~ s/[\n\r]/ /g;                                     #(P18)
    # Get rid of any internal DTD declaration blocks:
    $document =~ s/<!DOCTYPE\s+\w+[^\]]*?\]>/ /g;                  #(P19)
    # Get rid of any DTD references:
    $document =~ s/<!DOCTYPE[^<>]+?>/ /g;                          #(P20)
    # Get rid of any comment blocks:
    $document =~ s/<!--.*?-->/ /g;                                 #(P21)
    # Replace '&lt; ... >, by  '&lt; .... &gt;'
    $document =~ s/(\&lt;[^<> ]*?)>/$1\&gt;/g;                     #(P22)
    # Break the document into tags and text:
    my @tokens =                                                   #(P23)
        $document =~ /(<.+?>)?                    # extract tags   #(P24)
                      ([^<>]*)?                   # extract text   #(P25)
                      (<!\[CDATA\[.*?\]\]>)?/gx;  # extract CDATA  #(P26)
    # Get rid of empty array elements produced by the previous operation:
    @tokens = grep $_, @tokens;                                    #(P27)
    # Get rid of any just whitespace array elements produced by
    # the previous operations:
    @tokens = grep !/^\s*$/, @tokens;                              #(P28)
    # Get rid of any white space before and/or 
    # after the text elements:
    @tokens = map {/^\s*(.*?)\s*$/; $1} @tokens;                   #(P29)
    # Get rid of any XML processing instructions:
    @tokens = grep !/^<\?/, @tokens;                               #(P30)

    # The following commented out block is useful for troubleshooting:
    #   for (my $i = 407; $i < 427; $i++) { 
    #     print "$i>>  $tokens[$i]\n"; 
    #   }
    #   print "@tokens\n";
    #   foreach (@tokens) { print "$_\n"; }

    my $root = undef;                                              #(P31)
    my @tag_stack;                                                 #(P32)
    my $element_index = 0;                                         #(P33)
    foreach my $token (@tokens) {                                  #(P34)
        $element_index++;                                          #(P35)
        # Are we looking at an end tag?
        if ($token =~ /^<\//) {                                    #(P36)
            # get name of the end tag:
            $token =~ /^<\/([\w:-]*)/;                             #(P37)
            my $tagname = $1;                                      #(P38)
            if ($tagname eq $tag_stack[0]->getTagName) {           #(P39)
                shift @tag_stack;                                  #(P40)
            } else {                                               #(P41)
                die "Parse error: invalid tag " .                  #(P42)
                    "nesting with tagname \'$tagname\' at " .
                    "element index $element_index\n";
            }
            next;                                                  #(P43)
        # Are we looking at a start tag?
        } elsif ($token =~ /^<[^!]/) {                             #(P44)
            # get tag name
            # the //g option is for \G anchor in (P49) and (P54)
            $token =~ /^<([\w:-]*)/g;                              #(P45)
            my $tagname = $1;                                      #(P46)
            # Establish root if this is the first start tag:
            unless (defined $root) {                               #(P47)
                $root = SimpleElement->new( $tagname );            #(P48)
                # Extract the attributes part of the root element:
                $token =~ /\G(.*)>$/;                              #(P49)
                # If attributes are found:
                if ($1) {                                          #(P50)
                    # Construct attribute name-value pairs:
                    my @att_val_pairs =                            #(P51)
                             $1 =~ /([\w:-]+)\s*=\s*"(\S+)"/g;
                    while (@att_val_pairs) {                       #(P52)
                        $root->setAttribute(shift @att_val_pairs,
                                            shift @att_val_pairs);
                    }                                              
                }
                # Push root into the elements unless it is a 
                # self-closing element, in which case this is the 
                # only node in the document:
                push @{$self->{_all_elements}}, $root;             #(P53)
                unshift @tag_stack, $root unless $token =~ /\/>$/; #(P54)
            } else {                                               #(P55)
                die "Parse error: Found element outside root element\n" 
                    unless @tag_stack;                             #(P56)
                my $ele = SimpleElement->new( $tagname );          #(P57)
                # Extract the attribute portion of the start tag:
                $token =~ /\G(.*)>$/;                              #(P58)
                # If attributes are found:
                if ($1) {
                    # Attribute names can contain ':' and 
                    # attribute values can contain all characters 
                    # permissible in a URL:
                    my @att_val_pairs =                            #(P59)
                             $1 =~ /([\w:-]+)\s*=\s*"(\S+)"/g;
                    while (@att_val_pairs) {                       #(P60)
                        $ele->setAttribute( shift @att_val_pairs,
                                            shift @att_val_pairs);
                    }                                              
                }
                $tag_stack[0]->addChildElement( $ele );            #(P61)
                push @{$self->{_all_elements}}, $ele;              #(P62)
                # Push the new element into the elements
                unshift @tag_stack, $ele unless $token =~ /\/>$/;  #(P63)
            }
            next;                                                  #(P64)
        } else {                                                   #(P65)
            $tag_stack[0]->setText( $token );                      #(P66)
        }
    }
    die "Parse error: Probably some end tag missing\n"             #(P67)
            if @tag_stack;
    $self->{_rootDOMTree} = $root;                                 #(P68)
}

# The actual work of displaying the DOM tree is done by the 
# the local function _display_element shown next.
sub displayDOMTree {                                               #(P69)
    my $self = shift;
    print "\nThe parse tree:\n\n";
    _display_element( $self->{_rootDOMTree}, "" );
}

sub _display_element {                                             #(P70)
    my ($ele, $display_offset) = @_;
    if (!$display_offset) {
        print $ele->getTagName;
    } else {
        print $display_offset, $ele->getTagName;
    }
    my $ele_attributes = $ele->getAttributeHash;
    if ( %$ele_attributes ) {
        print " (attributes:  ";
        while ( my ($key, $value) = each %$ele_attributes ) {
            print " $key = $value";
        }
        print ") ";
    }
    my $text = $ele->getText;
    print " (Text: $text)" if $text =~ /\S/;
    print "\n";
    my $children = $ele->getChildElements;
    $display_offset .= "    ";
    foreach my $child (@$children) {
        _display_element( $child, $display_offset );
    }
}

1
