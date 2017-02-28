#!/usr/local/bin/python

# Shape.py

#---------------------------  class Shape  -----------------------------
class Shape:                                                        #(A)
    def __init__( self ):                                           #(B)
        raise NotImplementedError("abstract class - no constructor")#(C)
    def area(self):                                                 #(D)
        raise NotImplementedError( "abstract root class" )          #(E)
    def circumference(self):                                        #(F)
        raise NotImplementedError( "abstract root class" )          #(G)

#--------------------------  class Circle  -----------------------------
class Circle( Shape ):                                              #(H)
    def __init__( self, rad ):                                      #(I)
        self.radius = rad                                           
    def area(self):                                                 #(J)
        return 3.14159 * self.radius * self.radius                  
    def circumference(self):                                        #(K)
        return 2 * 3.14159 * self.radius                      

#-------------------------  class Rectangle  ---------------------------
class Rectangle( Shape ):                                           #(L)
    def __init__( self, len, wid ):                                 #(M)
        self.length = len                                           
        self.width = wid                                            
    def area(self):                                                 #(N)
        return self.length * self.width                          
    def circumference(self):                                        #(O)
        return 2 * (self.length + self.width)            

#-----------------------------------------------------------------------       
#               global function get_shape_properties()
#-----------------------------------------------------------------------
def get_shape_properties( x ):                                      #(P)
    assert isinstance( x, Shape )                                   #(Q)
    print x.area()                                                  #(R)
    print x.circumference()                                         #(S)

#-----------------------------------------------------------------------       
#                             Test code
#-----------------------------------------------------------------------
#shape1 = Shape()                     # ERROR                       #(T)
#print shape1.area()                  # ERROR                       #(U)
#print shape1.circumference()         # ERROR                       #(V)

shape2 = Circle( 4 );                                               #(W)
get_shape_properties( shape2 )        # 50.26  25.13                #(X)

shape3 = Rectangle( 4, 5 )                                          #(Y) 
get_shape_properties( shape3 )        # 20  18                      #(Z)
