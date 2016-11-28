#!/usr/bin/env python

### TestREX.py

### Python version of Robert Cameron's REX XML shallow parser
### as posted by David Niergarth

import re                                                            #(A)

TextSE = "[^<]+"                                                     #(B)
UntilHyphen = "[^-]*-"                                               #(C)
Until2Hyphens = UntilHyphen + "(?:[^-]" + UntilHyphen + ")*-"        #(D)
CommentCE = Until2Hyphens + ">?"                                     #(E)
UntilRSBs = "[^\\]]*](?:[^\\]]+])*]+"                                #(F)
CDATA_CE = UntilRSBs + "(?:[^\\]>]" + UntilRSBs + ")*>"              #(G)
S = "[ \\n\\t\\r]+"                                                  #(H)
NameStrt = "[A-Za-z_:]|[^\\x00-\\x7F]"                               #(I)
NameChar = "[A-Za-z0-9_:.-]|[^\\x00-\\x7F]"                          #(J)
Name = "(?:" + NameStrt + ")(?:" + NameChar + ")*"                   #(K)
QuoteSE = "\"[^\"]*\"|'[^']*'"                                       #(L)
DT_IdentSE = S+Name+ "(?:" + S + "(?:" + Name + "|" + QuoteSE + "))*"#(M)
MarkupDeclCE = "(?:[^\\]\"'><]+|" + QuoteSE + ")*>"                  #(N)
S1 = "[\\n\\r\\t ]"                                                  #(O)
UntilQMs = "[^?]*\\?+"                                               #(P)
PI_Tail = "\\?>|" + S1 + UntilQMs + "(?:[^>?]" + UntilQMs + ")*>"    #(Q)
DT_ItemSE = "<(?:!(?:--" + Until2Hyphens + ">|[^-]" + MarkupDeclCE + \
        ")|\\?" + Name + "(?:" + PI_Tail + "))|%" + Name + ";|" + S  #(R)
DocTypeCE = DT_IdentSE + "(?:" + S + ")?(?:\\[(?:" + DT_ItemSE + \
                      ")*](?:" + S + ")?)?>?"                        #(S)
DeclCE = "--(?:" + CommentCE + ")?|\\[CDATA\\[(?:" + CDATA_CE + \
                      ")?|DOCTYPE(?:" + DocTypeCE + ")?"             #(T)
PI_CE = Name + "(?:" + PI_Tail + ")?"                                #(U)
EndTagCE = Name + "(?:" + S + ")?>?"                                 #(V)
AttValSE = "\"[^<\"]*\"|'[^<']*'"                                    #(W)
ElemTagCE = Name + "(?:" + S + Name + "(?:" + S + ")?=(?:" + S + \
                      ")?(?:" + AttValSE + "))*(?:" + S + ")?/?>?"   #(X)
MarkupSPE = "<(?:!(?:" + DeclCE + ")?|\\?(?:" + PI_CE + ")?|/(?:" + \
                      EndTagCE + ")?|(?:" + ElemTagCE + ")?)"        #(Y)
XML_SPE = TextSE + "|" + MarkupSPE                                   #(Z)

# Parsing function:
def ShallowParse(XML_document):                                      #(a)
	return re.findall(XML_SPE, XML_document)                     #(b)

if __name__ == '__main__':                                           #(c)
    import sys                                                       #(d)
    # Read the XML source document:
    FILE = open( sys.argv[1] )                                       #(e)
    doc_str = FILE.read()                                            #(f)
    parse_result = ShallowParse( doc_str )                           #(g)
    num_tokens = len(parse_result)                                   #(h)
    print "Number of tokens extracted: ",  num_tokens                #(i)
    for i in range(len(parse_result)):                               #(j)
        if parse_result[i]:                                          #(k)
            print "Item %s:  %s" % (i, parse_result[i])              #(l)
        else: print "item %s: " % i                                  #(m)
