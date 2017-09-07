#!/usr/bin/python

### SubclassingStrClass.py

#-----------------------  class silly_string  -----------------------

class silly_string( str ):                                          #(A)
    def __new__( cls, arg = "@@" ):                                 #(B)
        l = list( arg )                                             #(C)
        l.reverse()                                                 #(D)
        arg = arg + "".join(l)                                      #(E)
#        print ">>>>>  ", str(l)
#        arg = arg + str(l)                                      #(E)
        return str.__new__( cls, arg )                              #(F)

#----------------------------  Test Code  ------------------------------

s1 = silly_string( "hello" )                                        #(G)
print s1                                    # helloolleh            #(H)
print isinstance( s1, silly_string )        # True                  #(I)
print isinstance( s1, str )                 # True                  #(J)
print isinstance( s1, object )              # True                  #(K)

s2 = silly_string( "jello" )                                        #(L)
print s2                                    # jelloollej            #(M)

s3 = s1 + s2                                                        #(N)
print s3                                    # helloollehjelloollej  #(O)
print isinstance( s3, silly_string )        # False                 #(P)
print isinstance( s3, str )                 # True                  #(Q)
print isinstance( s3, object )              # True                  #(R)

s = silly_string()                                                  #(S)
print s                                     # @@@@                  #(T)
