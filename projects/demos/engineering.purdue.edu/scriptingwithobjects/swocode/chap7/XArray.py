#!/usr/bin/env python

###  XArray.py

#----------------------------  Class  XArray  -------------------------
class XArray( object ):                                             #(A)

    def __init__( self, arr_arg ):                                  #(B)
        self._arr = list(arr_arg)                                  
        self._size = len( arr_arg )                                
        
    def __str__( self ):                                            #(C)
        'To create a print representation'          
        if self._size == 0:                                        
            return ''                                              
        return '_'.join( map( str, self._arr ) )                   
   
    def __contains__( self, ele ):                                  #(D)
        "To enable 'if a in b' and 'if a not in b' syntax"
        if self._size == 0:                                        
            raise ValueError, "X instance has no elements"         
        else:                                                      
            if ele in self._arr:                                   
                return True                                        
        return False                                               

    def __getitem__( self, i ):                                     #(E)
        "To enable array-like access syntax 'x[i]'"
        return self._arr[i]                                        

    def __add__(self, other):                                       #(F)
        "To enable 'x+y' syntax"
        if self._size != other._size:                              
            raise ValueError("X instances must be of the same size")
        outlist = []                                               
        for i in range( self._size ):                              
            if isinstance( self[i], (int, long, float) ) and \
                     isinstance( other[i], (int, long, float) ):    #(G)
                outlist.append(self[i] + other[i])                 
            elif isinstance( self[i], str ) and \
                               isinstance( other[i], str ):         #(H)
                outlist.append(self[i] + other[i] )                
            else:                                                 
                raise ValueError("Mismatched elements for '+'")     #(I)
        return XArray( outlist )                                       

    def __iter__( self ):                                           #(J)
        "To enable 'for item in container' syntax for loops"
        return XArray_iterator( self )                          

    def _lshift_by_one( self ):                                     #(K)
        'For in-place left circular shift by 1 position'           
        leftmost = self[0]                                         
        self._arr.pop(0)                                           
        self._arr.append( leftmost )                               

    def __lshift__( self, n ):                                      #(L)
        "To enable the syntax 'x<<n' for left-shifting the elements"
        for i in range(n):
            self._lshift_by_one()

    def __invert__( self ):                                         #(M)
        '''
        To enable inversion with the '~' operator.
        We negate the number elements and reverse the
        string elements
        '''
        import operator   # To demonstrate isNumberType() predicate
        outlist = []
        for i in range( self._size ):
            if operator.isNumberType( self[i] ) == True:            #(N)
                outlist.append( -self[i] )
            else:
                list_of_chars = list( self[i] )                     #(O)
                list_of_chars.reverse()
                reversed = ''.join(list_of_chars)
                outlist.append( reversed )
        return XArray(outlist)

#---------------------  Class X_iterator   -----------------------------
class XArray_iterator:                                              #(P)
    def __init__( self, xobj ):                                     #(Q)
        self.items = xobj._arr
        self.index = -1
    def __iter__( self ):                                           #(R)
        return self
    def next( self ):                                               #(S)
        self.index += 1
        if self.index < len( self.items ):
            return self.items[ self.index ]
        else:
            raise StopIteration

#------------------------   Test Code   ------------------------------

if __name__ == '__main__':                                          #(T)

    x1 = XArray( (1,2,"hello",3) )                                  #(U)
    print x1                             # 1_2_hello_3

    x2 = XArray( (7,8,"jello",9) )                                  #(V)
    print x2                             # 7_8_jello_9

    print "hello" in x1                  # True                     #(W)

    print x1[2], x2[2]                   # hello jello              #(Y)
    
    x3 = x1 + x2                                                    #(Z)
    print x3                             # 8_10_hellojello_12

    for item in x3: print item,          # 8 10 hellojello 12       #(a)
    print
    
    x3 << 2                                                         #(b)
    print x3                             # hellojello_12_8_10

    print ~x3                            # ollejolleh_-12_-8_-10    #(c)
