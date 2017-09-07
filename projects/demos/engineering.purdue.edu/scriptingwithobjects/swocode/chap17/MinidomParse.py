#!/usr/bin/env python

###  MinidomParse.py

import xml.dom.minidom
import sys    

if len( sys.argv ) is not 2:
    sys.exit( "need an xml file to parse" )        
xmldoc = sys.argv[1]                                                 

dom = xml.dom.minidom.parse( xmldoc )                                #(A)
rootNode = dom.documentElement                                       #(B)
print rootNode              #<DOM Element: NS1:A at 0x4035b56c>      #(C)

nodeset =set([])                                                     #(D)

def print_node_info( node, offset ):                                 #(E)
    print                              
    if node not in nodeset:                                          #(F)
        nodeset.add( node )                                          #(G)
        if node.nodeType == node.ELEMENT_NODE:                       #(H)
            print offset, "node name: ", node.nodeName               #(I)
            print offset, "node local name: ", node.localName        #(J)
            print offset, "node name prefix: ", node.prefix          #(K)
            print offset, "namespace URI: ", node.namespaceURI       #(L)
            try:
                if node.firstChild.data:                             #(M)
                    nodeset.add( node.firstChild )                   #(N)
                    print offset, "node data: ",node.firstChild.data #(O)
            except: pass
            if node.hasAttributes():                                 #(P)
                print offset, "Attributes: "                         #(Q)
                for item in node.attributes.items():                 #(R)
                    print offset, "  ", item[0], "  ", item[1]       #(S)
        elif node.nodeType == node.TEXT_NODE:                        #(T)
            if node.data.lstrip().rstrip():                          #(U)
                print offset, "purely text node: ", \
                      node.data.lstrip().rstrip()                    #(V)
                print
        elif node.nodeType == node.CDATA_SECTION_NODE:               #(W)
            print offset, "CDATA Section Node: "                     #(X)
            print offset, node.data                                  #(Y)
        if node.hasChildNodes():                                     #(Z)
            offset += "   "                                          #(a)
            for node in node.childNodes:                             #(b)
                print_node_info( node, offset )                      #(c)
    
print_node_info( rootNode, "" )                                      #(d)
