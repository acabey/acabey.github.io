#!/usr/bin/env python

### MyXArray.py

from XArray import XArray

#--------------------------  Class  MyXArray  --------------------------
class MyXArray( XArray ):                                           #(A)

    def __init__( self, arr_arg ):                                  #(B)
        self._arr = list(arr_arg)                                  
        self._size = len( arr_arg )                                
        self._how_many_nums = \
            len( filter( lambda x: isinstance(x, int), arr_arg ) )  #(C)

    def get_how_many_nums( self ):                                  #(D)
        return self._how_many_nums
    
    def __str__( self ):                                            #(E)
        'To create a print representation'          
        if self._size == 0:                                        
            return ''                                              
        return '____'.join( map( str, self._arr ) )                   


#------------------------   Test Code   ------------------------------

if __name__ == '__main__':                                          #(F)

    x_base = XArray( (1,2,"hello",3) )                              #(G)
    print x_base                      # 1_2_hello_3                 #(H)
    
    x_derived = MyXArray( (1,2,"hello",3) )                         #(I)
    print x_derived                   # 1____2____hello____3        #(J)
