### EventBasedParserUsingRex.pm

package EventBasedParserUsingRex;

use strict;
use re 'eval';                                                       #(A)

my $parser_instance;                                                 #(B)

# Constructor:
sub new {                                                           #(C1)
    my $class = shift;                                              #(C2)
    $parser_instance = bless {                                      #(C3)
        _documentName => undef,                                     #(C4)
        _startTagHandler => undef,                                  #(C5)
        _endTagHandler => undef,                                    #(C6)
        _selfClosingTagHandler => undef,                            #(C7)
        _charHandler => undef,                                      #(C8)
    }, $class;                                                      #(C9)
}

sub setHandlers {                                                   #(S1)
    my $self = shift;                                               #(S2)
    my %handlers = @_;                                              #(S3)
    $self->{_startTagHandler} = $handlers{StartTag};                #(S4)
    $self->{_endTagHandler} = $handlers{EndTag};                    #(S5)
    $self->{_selfClosingTagHandler} = $handlers{SelfClosingTag};    #(S6)
    $self->{_charHandler} = $handlers{CharData};                    #(S7)
    $parser_instance = $self;                                       #(S8)
}

# The main parsing function.  Call syntax
#   $parser = EventBasedParserUsingRex->new();
#   $parser->parse( $document_name );
sub parse {                                                         #(P1)      
    my ($self, $filename) = @_;                                     #(P2)
    $self->{_documentName} = $filename;                             #(P3)
    local $/ = undef;                                               #(P4)
    open FILEIN, $self->{_documentName};                            #(P5)
    my $document = <FILEIN>;                                        #(P6)
    my $XML_SPE = $self->makeParseRegex();                          #(P7)
    my @tokens = $document =~ /$XML_SPE/g;                          #(P8)
    return @tokens;                                                 #(P9)
}

# All of the regular expressions shown below are from the REX shallow
# parser for XML by Robert Cameron:
sub makeParseRegex {                                               #(P10)
    my $self = shift;                                              #(P12)
    my $TextSE = "[^<]+";                                          #(P13)
    my $UntilHyphen = "[^-]*-";                                    #(P14)
    my $Until2Hyphens = "$UntilHyphen(?:[^-]$UntilHyphen)*-";      #(P15)
    my $CommentCE = "$Until2Hyphens>?";                            #(P16)
    my $UntilRSBs = "[^\\]]*](?:[^\\]]+])*]+";                     #(P17)
    my $CDATA_CE = "$UntilRSBs(?:[^\\]>]$UntilRSBs)*>";            #(P18)
    my $S = "[ \\n\\t\\r]+";                                       #(P19)
    my $NameStrt = "[A-Za-z_:]|[^\\x00-\\x7F]";                    #(P20)
    my $NameChar = "[A-Za-z0-9_:.-]|[^\\x00-\\x7F]";               #(P21)
    my $Name = "(?:$NameStrt)(?:$NameChar)*";                      #(P22)
    my $QuoteSE = "\"[^\"]*\"|'[^']*'";                            #(P23)
    my $DT_IdentSE = "$S$Name(?:$S(?:$Name|$QuoteSE))*";           #(P24)
    my $MarkupDeclCE = "(?:[^\\]\"'><]+|$QuoteSE)*>";              #(P25)
    my $S1 = "[\\n\\r\\t ]";                                       #(P26)
    my $UntilQMs = "[^?]*\\?+";                                    #(P27)
    my $PI_Tail = "\\?>|$S1$UntilQMs(?:[^>?]$UntilQMs)*>";         #(P28)
    my $DT_ItemSE = "<(?:!(?:--$Until2Hyphens>|[^-]$MarkupDeclCE)|".
                            "\\?$Name(?:$PI_Tail))|%$Name;|$S";    #(P29)
    my $DocTypeCE = 
            "$DT_IdentSE(?:$S)?(?:\\[(?:$DT_ItemSE)*](?:$S)?)?>?"; #(P30)
    my $DeclCE = "--(?:$CommentCE)?|\\[CDATA\\[(?:$CDATA_CE)?|" .
                                   "DOCTYPE(?:$DocTypeCE)?";       #(P31)
    my $PI_CE = "$Name(?:$PI_Tail)?";                              #(P32)
    my $EndTagCE = "$Name(?:$S)?>?";                               #(P33)
    my $AttValSE = "\"([^<\"]*)\"|'[^<']*'";                       #(P34)
    my $ElemTagCE = "$Name(?:$S($Name)(?:$S)?=(?:$S)?" .
                              "(?:$AttValSE))*(?:$S)?/?>?";        #(P35)
    my $MarkupSPE = "<(?:!(?:$DeclCE)?|\\?(?:$PI_CE)?|/" .
                    "(?:($EndTagCE)(?{_end_tag_handler('<'.\$^N)}))?|".
                    "(?:($ElemTagCE)(?{_start_tag_handler('<'.\$^N)}))?)";   
                                                                   #(P36)
    my $XML_SPE = "($TextSE)(?{_char_handler(\$^N)})|$MarkupSPE";  #(P37)
    return $XML_SPE;                                               #(P38)
}

# Handler code:

sub _start_tag_handler {                                            #(H1)
    my $tagname_and_attributes = shift @_;                          #(H2)
    if ( (index($tagname_and_attributes,'/>') > 0)  and
         $parser_instance->{_selfClosingTagHandler} ) {             #(H3)
        $parser_instance->
              {_selfClosingTagHandler}->($tagname_and_attributes);  #(H4)
    } elsif ($parser_instance->{_startTagHandler}) {                #(H5)
        $parser_instance->
              {_startTagHandler}->($tagname_and_attributes);        #(H6)
    }                                                             
}

sub _end_tag_handler {                                              #(H7)
    my $tagname = shift @_;                                         #(H8)
    if ( $parser_instance->{_endTagHandler} ) {                     #(H9)
        $parser_instance->{_endTagHandler}->($tagname);            #(H10)
    }
}

sub _char_handler {                                                #(H11)
    my $string = shift;                                            #(H12)
    if ( $parser_instance->{_charHandler} ) {                      #(H13)
        $parser_instance->{_charHandler}->($string);               #(H14)
    }
}

1
