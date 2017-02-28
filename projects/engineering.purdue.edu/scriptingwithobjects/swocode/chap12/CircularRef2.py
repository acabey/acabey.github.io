#!/usr/local/bin/python

# CircularRef2.py

import weakref                                                      #(A)

#---------------------------  class X  ---------------------------------
class X:                                                           #(X1)
    def __init__( self, id ):                                      #(X2)
        print "Creating X object: id = " + str(id)                 #(X3)
        self.id = id                                               #(X4)

    def setYfield( self, yobj ):                                   #(X5)
        self.yobj = yobj                                           #(X6)

    def __del__( self ):                                           #(X7)
        print "X obj will be destroyed: id = " + str(self.id)      #(X8)

#---------------------------  class Y  ---------------------------------
class Y:                                                           #(Y1)
    def __init__( self, id ):                                      #(Y2)
        print "Creating Y object: id = " + str(id)                 #(Y3)
        self.id = id                                               #(Y4)

    def setXfield( self, xobj ):                                   #(Y5)
        self.xobj = xobj                                           #(Y6)

    def __del__( self ):                                           #(Y7)
        print "Y obj will be destroyed: id = " + str(self.id)      #(Y8)

#--------------------------  Test Code  --------------------------------
i = 0;                                                             #(T1)
while (i < 3):                                                     #(T2)
#while (i < 100000):                                               #(T3)
    x = X(i)                                                       #(T4)
    y = Y(i)                                                       #(T5)
    x.setYfield( y )                                               #(T6)
    y.setXfield( x )                                               #(T7)
#    y.setXfield( weakref.ref( x ) )                               #(T8)
    i = i+1                                                        #(T9)

print "\n\nDONE WITH THE WHILE LOOP\n\n";                         #(T10)
