#!/usr/bin/env python

### SimpleDOMParser.py

import string                                                       #(P1)
import re                                                           #(P2)
import sys                                                          #(P3)
import SimpleElement                                                #(P4)

#--------------------------  Utility routine ---------------------------

def _display_element( ele, display_offset ):                        #(P5)
    if not display_offset:                                         
        print ele.getTagName(),                                    
    else:                                                          
        print display_offset, ele.getTagName(),                    

    ele_attributes = ele.getAttributeDict()                       
    if ele_attributes:                                            
        print " (attributes:  ",                                  
        for item in ele_attributes.items():                       
            print item[0] + " = " + item[1],                      
        print ") ",                                               
    text = ele.getText()                                          
    if text: print "(Text: %s)" % text,
    print
    children = ele.getChildElements()                             
    display_offset += "    "                                      
    for child in children:                                         
        _display_element( child, display_offset )


#------------------------  Class SimpleDOMParser  ---------------------

# The root to the DOM tree is of type SimpleElement as defined in the
# the module of the same name.  This root becomes the value of the
# _rootDOMTree instance variable.  All elements regardless of their
# level are stored in the list _all_elements.  This is to facilitate
# search for text values of the leaf nodes

class SimpleDOMParser:                                              #(P6)
    def __init__(self):                                             #(P7)
        self._documentName = None                                   #(P8)
        self._rootDOMTree = None                                    #(P9)
        self._all_elements = []                                    #(P10)

    def showAllElements(self):                                     #(P11)
        ele_names = map(lambda node:node.getTagName(),self._all_elements)
        print "\nELEMENT TYPES:  ", ele_names

    def countElements(self):                                       #(P12)
        return len(self._all_elements)

    def searchElementsForString(self, str):                        #(P13)
        eles = filter( lambda node: re.search( str, node.getText() ), \
                       self._all_elements)                         #(P14)
        ele_names = map(lambda node:node.getTagName(), eles)       #(p15)
        if ele_names:                                              #(P16)
            print "\nThe string %s found in the following elements: " \
                  % str,                                           #(P17)
            for ele in ele_names: print "%s " % ele,               #(P18)
        else:                                                      #(P19)
            print "\nThe string %s not found in any element" % str #(P20)

    def parse(self, filename):                                     #(P21)
        self._documentName = filename                              #(P22)
        FILEIN = open(self._documentName)                          #(P23)
        # Read the whole document into a single string:
        document = FILEIN.read()                                   #(P24)
        # Get rid of newlines:   
        document=document.translate(string.maketrans('',''),'\n\r')#(P25)
        # Get rid of any internal DTD declaration blocks:
        document = re.sub( r'<!DOCTYPE\s+\w+[^\]]*?\]>', ' ', \
                           document)                               #(P26)
        # Get rid of any DTD references:
        document = re.sub( r'<!DOCTYPE[^<>]+>', ' ', document )    #(P27)
        # Get rid of any comment blocks:
        document = re.sub( r'<!--.*?-->', ' ', document )          #(P28)
        # Replace '&lt; ... >, by  '&lt; .... &gt;'
        document = re.sub( r'(\&lt;[^<> ]*?)>',r'\1\&gt', document)#(P29)
        # Break the document into tags and text:
        token_tuples = re.findall( \
            re.compile( r'''(<.+?>)?                    # extract tags 
                            ([^<>]*)                    # extract text
                            (<!\[CDATA\[.*?\]\]>)?''',  # extract CDATA 
                        re.VERBOSE ), document )                   #(P30)
        tokens = []                                                #(P31)
        for tupl in token_tuples: tokens += tupl                   #(P32)
        # Get rid of empty tokens or tokens with just white space:
        tokens = [token.rstrip().lstrip() for token in tokens \
                  if token.rstrip().lstrip() is not '']            #(P33)
        # Get rid of any XML processing instructions:
        tokens = filter(lambda x: not re.match( r'<\?', x), tokens)#(P34)

        #The following commented out line is useful for troubleshooting:
        #for i in range(400,427): print tokens[i]                  #(P35)
        #print "All tokens: ", tokens                              #(P36)

        tag_stack = []                                             #(P37)
        element_index = 0                                          #(P38)
        for token in tokens:                                       #(P39)
            element_index += 1                                     #(P40)
            if re.match( r'</', token ):                           #(P41)
                # We are looking at an end tag like </phonebook>         
                # get name of the end tag:
                m = re.search( r'^</([\w:-]*)', token )            #(P42)
                tagname = m.group(1)                               #(P43)
                if tagname == \
                       tag_stack[len(tag_stack)-1].getTagName():   #(P44)
                    tag_stack.pop()                                #(P45)
                else:                                              #(P46)
                    raise Exception("Parse error: invalid tag " + \
                        "nesting with tagname " + tagname +  \
                        " at element index " + str(element_index) )#(P47)
                continue                                           #(P48)
            elif re.match( r'<[^!]', token ):                      #(P49)
                # We are looking at a start tag like <phonebook>
                m = re.search( r'^<([\w:-]*)', token )             #(P50)
                tagname = m.group(1)                               #(P51)
                ele = SimpleElement.SimpleElement( tagname )       #(P52)
                # Extract the attributes part of the new element:
                m = re.search( r'(.*)>$', token[m.end():] )        #(P53)
                rest_of_token = m.group(1)                         #(P54)
                if rest_of_token:                                  #(P55)
                    # Construct attribute name-value pairs:  
                    att_val_pairs = \
                       re.findall(r'([\w:-]+)\s*=\s*"(\S+)"', \
                                  rest_of_token)                   #(P56)
                    for tupl in att_val_pairs:                     #(P57)
                        ele.setAttribute(tupl[0], tupl[1])         #(P58)
                self._all_elements.append( ele )                   #(P59)
                # Establish root if this is the first start tag:
                if not self._rootDOMTree:                          #(P60)
                    self._rootDOMTree = ele                        #(P61)
                else:                                              #(P62)
                    if len(tag_stack) == 0:                        #(P63)
                        raise Exception("Parse Error: Found element"
                                     "outside the root element\n") #(P64)
                    tag_stack[len(tag_stack)-1].addChildElement(ele)
                if not token.endswith( r'/>' ):                    #(P65)
                    tag_stack.append( ele )                        #(P66)
                continue                                           #(P67)
            else:                                                  #(P68)
                tag_stack[len(tag_stack)-1].setText( token )       #(P69)
        if len(tag_stack) > 0:                                     #(P70)
            raise Exception( "Parse error: Probably some tag missing\n" )

    def displayDOMTree( self ):                                    #(P71)
        print "The parse tree:\n"                                  #(P72)
        _display_element( self._rootDOMTree, "" )                  #(P73)


if __name__ == '__main__':                                         #(P74)
    parser = SimpleDOMParser()                                     #(P75)
    parser.parse( sys.argv[1] )                                    #(P76)
    parser.showAllElements()                                       #(P77)
    N = parser.countElements()                                     #(P78)
    print "\nNumber of Elements: %d\n" % N                         #(P79)
    parser.displayDOMTree()                                        #(P80)
    parser.searchElementsForString( "hello" )                      #(P81)
