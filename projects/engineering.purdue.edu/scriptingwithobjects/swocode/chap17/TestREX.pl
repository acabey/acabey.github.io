#!/usr/bin/perl -w

### TestREX.pl

use strict;

# All of the regular expressions shown below that lead up to
# the definition of the XML shallow parsing expression that
# is assigned to $XML_SPE are by Robert Cameron [Cameron]

# Define the shallow parsing exression:

my $TextSE = "[^<]+";                                                #(A)
my $UntilHyphen = "[^-]*-";                                          #(B)
my $Until2Hyphens = "$UntilHyphen(?:[^-]$UntilHyphen)*-";            #(C)
my $CommentCE = "$Until2Hyphens>?";                                  #(D)
my $UntilRSBs = "[^\\]]*](?:[^\\]]+])*]+";                           #(E)
my $CDATA_CE = "$UntilRSBs(?:[^\\]>]$UntilRSBs)*>";                  #(F)
my $S = "[ \\n\\t\\r]+";                                             #(G)
my $NameStrt = "[A-Za-z_:]|[^\\x00-\\x7F]";                          #(H)
my $NameChar = "[A-Za-z0-9_:.-]|[^\\x00-\\x7F]";                     #(I)
my $Name = "(?:$NameStrt)(?:$NameChar)*";                            #(J)
my $QuoteSE = "\"[^\"]*\"|'[^']*'";                                  #(K)
my $DT_IdentSE = "$S$Name(?:$S(?:$Name|$QuoteSE))*";                 #(L)
my $MarkupDeclCE = "(?:[^\\]\"'><]+|$QuoteSE)*>";                    #(M)
my $S1 = "[\\n\\r\\t ]";                                             #(N)
my $UntilQMs = "[^?]*\\?+";                                          #(O)
my $PI_Tail = "\\?>|$S1$UntilQMs(?:[^>?]$UntilQMs)*>";               #(P)
my $DT_ItemSE = "<(?:!(?:--$Until2Hyphens>|[^-]$MarkupDeclCE)|" .  
                                "\\?$Name(?:$PI_Tail))|%$Name;|$S";  #(Q)
my $DocTypeCE = 
             "$DT_IdentSE(?:$S)?(?:\\[(?:$DT_ItemSE)*](?:$S)?)?>?";  #(R)
my $DeclCE = "--(?:$CommentCE)?|\\[CDATA\\[(?:$CDATA_CE)?|".
                                   "DOCTYPE(?:$DocTypeCE)?";         #(S)
my $PI_CE = "$Name(?:$PI_Tail)?";                                    #(T)
my $EndTagCE = "$Name(?:$S)?>?";                                     #(U)
my $AttValSE = "\"[^<\"]*\"|'[^<']*'";                               #(V)
my $ElemTagCE = "$Name(?:$S$Name(?:$S)?=(?:$S)?" .              
                                   "(?:$AttValSE))*(?:$S)?/?>?";     #(W)
my $MarkupSPE = "<(?:!(?:$DeclCE)?|\\?(?:$PI_CE)?|" .
                               "/(?:$EndTagCE)?|(?:$ElemTagCE)?)";   #(X)
my $XML_SPE = "$TextSE|$MarkupSPE";                                  #(Y)


# This function invoked in a list context will partition
# an XML document into its markup and text components:
sub ShallowParse {                                                   #(a)
  my($XML_document) = @_;                                            #(b)
  return $XML_document =~ /$XML_SPE/g;                               #(c)
}

# Read the XML source document:
$/ = undef;                                                          #(d)
my $string = <>;                                                     #(e)

my @parse_result = ShallowParse( $string );                          #(f)
my $num_tokens = @parse_result;                                      #(g)
print "Number of tokens extracted: $num_tokens\n\n";                 #(h)

my $i = 1;                                                     
foreach (@parse_result) {                                            #(i)
    print "Item $i:      $_\n" if  $_ !~ /^\s*$/;                    #(j)
    $i++;
}
