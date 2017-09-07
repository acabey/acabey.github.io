#!/usr/local/bin/python
  
## Quantifier.py

import re

regex = r'lulu*'                                                   #(A1)
filehandle = open( '/usr/share/dict/words' )                       #(A2)
done = 0                                                           #(A3)
while not done:                                                    #(A4)
    line = filehandle.readline()                                   #(A5)
    if line != "":                                                 #(A6)
        m = re.search( regex, line )                               #(A7)
        if ( m != None ):                                          #(A8)
            print line,                                            #(A9)
    else:                                                         #(A10)
        done = 1                                                  #(A11)
#                        cellular
#                        cellulose
#                        Honolulu
#                        lull
#                        lullaby
#                        lulled
#                        lulls
#                        multicellular


regex = r'lulu+'                                                   #(B1)
filehandle = open( '/usr/share/dict/words' )                       #(B2)
done = 0                                                         
while not done:                                                  
    line = filehandle.readline()                                 
    if line != "":                                               
        m = re.search( regex, line )                           
        if ( m != None ):                                        
            print line,                                          
    else:                                                        
        done = 1                                                 
#                        Honolulu


regex = r'lulu?'                                                   #(C1)
filehandle = open( '/usr/share/dict/words' )                       #(C2)
done = 0                                             
while not done:                                      
    line = filehandle.readline()                     
    if line != "":                                   
        m = re.search( regex, line )               
        if ( m != None ):                            
            print line,                              
    else:                                            
        done = 1                                     
#                        cellular
#                        cellulose
#                        Honolulu
#                        lull
#                        lullaby
#                        lulled
#                        lulls
#                        multicellular


regex = r'lulu{1,3}'                                               #(D1)
filehandle = open( '/usr/share/dict/words' )                       #(D2)
done = 0                                            
while not done:                                      
    line = filehandle.readline()                     
    if line != "":                                   
        m = re.search( regex, line )               
        if ( m != None ):                            
            print line,                             
    else:                                           
        done = 1                                    
#                        Honolulu


regex = r'lulu*?'                                                  #(E1)
filehandle = open( '/usr/share/dict/words' )                       #(E2)
done = 0                                          
while not done:                                   
    line = filehandle.readline()                  
    if line != "":                                
        m = re.search( regex, line )            
        if ( m != None ):                         
            print line,                           
    else:                                         
        done = 1                                  
#                        cellular
#                        cellulose
#                        Honolulu
#                        lull
#                        lullaby
#                        lulled
#                        lulls
#                        multicellular


regex = r'lulu+?'                                                  #(F1)
filehandle = open( '/usr/share/dict/words' )                       #(F2)
done = 0                                             
while not done:                                      
    line = filehandle.readline()                     
    if line != "":                                   
        m = re.search( regex, line )               
        if ( m != None ):                            
            print line,                              
    else:                                            
        done = 1                                     
#                         Honolulu


regex = r'lulu??'                                                  #(G1)
filehandle = open( '/usr/share/dict/words' )                       #(G2)
done = 0                                             
while not done:                                      
    line = filehandle.readline()                     
    if line != "":                                   
        m = re.search( regex, line )               
        if ( m != None ):                            
            print line,                              
    else:                                            
        done = 1                                     
#                         cellular
#                         cellulose
#                         Honolulu
#                         lull
#                         lullaby
#                         lulled
#                         lulls
#                         multicellular


regex = r'lulu{1,3}?'                                              #(H1)
filehandle = open( '/usr/share/dict/words' )                       #(H2)
done = 0                                             
while not done:                                      
    line = filehandle.readline()                     
    if line != "":                                   
        m = re.search( regex, line )               
        if ( m != None ):                            
            print line,                              
    else:                                            
        done = 1                                     
#                         Honolulu
