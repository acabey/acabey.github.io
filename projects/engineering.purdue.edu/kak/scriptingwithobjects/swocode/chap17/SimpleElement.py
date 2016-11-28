#!/usr/bin/env python

### class SimpleElement

class SimpleElement:                                                #(E1)
    def __init__(self, tagname):                                    #(E2)
        self._tagname = tagname                                     #(E3)
        self._text = ""                                             #(E4)
        self._attributes = {}                                       #(E5)
        self._childElements = []                                    #(E6)

    def getTagName(self):                                           #(E7)
        return self._tagname  
    
    def setTagName(self,tagname):                                   #(E8)
        self._tagname = tagname 

    def getText(self):                                              #(E9)
        return self._text     

    def setText(self, text):                                       #(E10)
        self._text += " " + text    
        return self          

    def getAttribute(self, attribute_name):                        #(E11)
        return self._attributes[attribute_name] 

    def getAttributeDict(self):                                    #(E12)
        return self._attributes    

    def setAttribute(self, attribute_name, value):                 #(E13)
        self._attributes[attribute_name] = value    
        
    def addChildElement(self, newSimpleElement):                   #(E14)
        self._childElements.append( newSimpleElement ) 

    def getChildElements(self):                                    #(E15)
        return self._childElements  

if __name__ == '__main__':                                         #(E16)

    # The test code shown below creates by hand a tree structure that
    # described the following element:
    #                                    
    #<famous>
    #    <listing>
    #        <first>John</first>
    #        <middle>C.</middle>
    #        <last>Hancock</last>
    #      </listing>
    #    <listing>
    #        <first>Susan</first>
    #        <last>Anthony</last>
    #    </listing>
    #</famous>

    root = SimpleElement( 'famous' )                               #(E17)
    ele = SimpleElement( 'listing' )
    root.addChildElement( ele )
    ele.addChildElement( SimpleElement( 'first ' ).setText( 'John' ) )
    ele.addChildElement( SimpleElement( 'last ' ).setText( 'Hancock' ) ) 
    ele = SimpleElement( 'listing' )
    root.addChildElement( ele )
    ele.addChildElement( SimpleElement( 'first ' ).setText( 'Susan' ) )
    ele.addChildElement( SimpleElement( 'last' ).setText( 'Anthony' ) )

    for ele1 in root.getChildElements():                           #(E18)
        for ele2 in ele1.getChildElements():        
            print ele2.getText()
