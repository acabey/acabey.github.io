package SimpleElement;

### SimpleElement.pm

sub new {                                                           #(E1)
    my ($class, $tagname) = @_;                                     #(E2)
    bless {                                                         #(E3)
        _tagname => $tagname,                                       #(E4)
        _text => "",                                                #(E5)
        _attributes => {},                                          #(E6)
        _childElements => [],                                       #(E7)
    }, $class;                                                      #(E8)
}

sub getTagName {                                                    #(E9)
    my $self = shift;
    $self->{_tagname};
}

sub setTagName {                                                   #(E10)
    my ($self, $tagname) = @_;
    $self->{_tagname} = $tagname;
}

sub getText {                                                      #(E11)
    my $self = shift;
    $self->{_text};
}
sub setText {                                                      #(E12)
    my ($self, $text) = @_;
    $self->{_text} .= " $text";
}

sub getAttribute {                                                 #(E13)
    my ($self, $attribute_name) = @_;
    $self->{_attributes}{$attribute_name};
}

sub getAttributeHash {                                             #(E14)
    my $self = shift;
    $self->{_attributes};
}

sub setAttribute {                                                 #(E15)
    my ($self, $attribute_name, $value) = @_;
    $self->{_attributes}{$attribute_name} = $value;
}

sub addChildElement {                                              #(E16)
    my ($self, $newSimpleElement) = @_;
    push @{$self->{_childElements}}, $newSimpleElement;
}

sub getChildElements {                                             #(E17)
    my $self = shift;
    $self->{_childElements};
}

1
