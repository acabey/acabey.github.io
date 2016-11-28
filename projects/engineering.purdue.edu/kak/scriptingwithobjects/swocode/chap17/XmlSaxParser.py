#!/usr/bin/env python

### XmlSaxParser.py

import xml.sax                                                       #(A)

#-------------------------  class MyHandlers  --------------------------
class MyHandlers( xml.sax.ContentHandler ):                          #(B)

    def startElement( self, name, attributes ):                      #(C)
        print "start tag recognized for element: " + name            #(D)
        if attributes:                                               #(E)
            print "    Attributes:"                                  #(F)
            for item in attributes.items():                          #(G)
                print "      ", item[0], " = ", item[1]              #(H)
            print                                                    #(I)
        
    def characters( self, content ):                                 #(J)
        content = content.lstrip().rstrip()                          #(K)
        if content:                                                  #(L)
            print "character handler invoked for string: ", content  #(M)

    def endElement( self, name ):                                    #(N)
        print "end tag recognized for element: " + name              #(O)
        
    def startDocument( self ):                                       #(P)
        print "document parse started"                               #(Q)

    def endDocument( self ):                                         #(R)
        print "end of document reached --- parse ended"              #(S)

    def processingInstruction( self, target, data ):                 #(T)
        print "processing instruction recognized for target ",target #(U)
        print "    processing instruction data: " + data             #(V)

#----------------------- end of MyHandlers class  ----------------------

if __name__ == '__main__':                                           #(W)

    import sys    
    if len( sys.argv ) is not 2:
        sys.exit( "need an xml file" )        
    xmldoc = sys.argv[1]                                             #(X)

    # make_parser() returns a xml.sax.XMLReader object:
    reader = xml.sax.make_parser()                                   #(Y)
    reader.setContentHandler( MyHandlers() )                         #(Z)

    print xml.sax.handler.all_features                               #(a)
    print xml.sax.handler.feature_namespaces                         #(b)
                             # http://xml.org/sax/features/namespaces
    xml.sax.handler.feature_namespaces = True                        #(c)
    print xml.sax.handler.feature_namespaces     # True              #(d)

    try:                                                             #(e)
        reader.parse( xmldoc )                                       #(f)
    except xml.sax.SAXParseException, e:                             #(g)
        print "  parsing error:    ", e.getMessage()                 #(h)
        print "  in line:          ", e.getLineNumber()              #(i)
        print "  at location:      ", e.getColumnNumber()            #(j)
        print "  exception raised: ", e.getException()               #(k)
        print "  for event ID:     ", e.getPublicId()                #(l) 
        print "  for system ID:    ", e.getSystemId()                #(m) 
        sys.exit(1)                                                  #(n)
