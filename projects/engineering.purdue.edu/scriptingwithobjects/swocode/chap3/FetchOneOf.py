#!/usr/bin/python

# FetchOneOf.py

'''This module is a compilation of the read functions for
   reading just one of something in a text file.'''                  #(A)

def fetchOneWord( filehandle ):                                      #(B)
    word = ""                                                        #(C)
    x = filehandle.read(1)                                           #(D)
    if x == '': return ""           # end of file condition          #(E)
    if (x == ' ') or ( x == '\n'):                                   #(F)
        while (x == ' ') or (x == '\n'):                             #(G)
            x = filehandle.read(1)                                   #(H)
    if x == '': return ""           # end of file condition          #(I)
    word = word + x                                                  #(J)
    while (x != ' ') and (x != '\n'):                                #(K)
        x = filehandle.read(1)                                       #(L)
        if (x != ' ') and ( x != '\n'):                              #(M)
            word = word + x                                          #(N)
    return word                                                      #(O)

def fetchOneInteger( filehandle ):                                   #(P)
    word = fetchOneWord( filehandle )                                
    return int( word )                                               

def fetchOneFloat( filehandle ):                                     #(Q)
    word = fetchOneWord( filehandle )                         
    return float( word )                                      

def wordCount( filehandle ):                                         #(R)
    count = 0                                                        #(S)
    while (1 ):                                                      #(T)
        w = fetchOneWord( filehandle )                               #(U)
        if ( not w ): break                                          #(V)
        count = count + 1                                            #(W)
    return count                                                     #(X)

best_pie = "applepie"                                                #(Y)


# Test code follows:
# Test file info.txt:
#      
#      how 
#        
#    
#          are you
#    hello
#        
#       123 456
#    789
#    
#
# Test file a.data:
#
#    123 456 7890
#    345 

if __name__ == '__main__':                                           #(Z)

    handle = open( 'info.txt' )                                    
    newword = fetchOneWord( handle )
    print newword                                     # how
    newword = fetchOneWord( handle )
    print newword                                     # are
    newword = fetchOneWord( handle )
    print newword                                     # you
    handle.close()

    handle = open( 'a.data' )                         
    num = fetchOneInteger( handle )
    print num                                         # 123
    print type( num )                                 # <type 'int'>
    handle.close()

    handle = open( 'a.data' )
    num = fetchOneFloat( handle )
    print num                                         # 123.0
    print type( num )                                 # <type 'float'>
    handle.close()

    handle = open( 'info.txt' ) 
    print wordCount( handle )                         # 7
    handle.close()
    
    print best_pie                                    # applepie
