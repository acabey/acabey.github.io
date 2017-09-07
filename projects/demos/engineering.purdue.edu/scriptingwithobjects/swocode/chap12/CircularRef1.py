#!/usr/bin/env python

### CircularRef1.py

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
x = X(1)                # Creating X object: id = 1                #(T1)
y = Y(1)                # Creating Y object: id = 1                #(T2)
x.setYfield( y )                                                   #(T3)
#y.setXfield( x  )                                                 #(T4)
y.setXfield( weakref.ref( x ) )                                    #(T5)

print x.yobj            # <__main__.Y instance at 0x401f9d6c>      #(T6)
print y.xobj                                                       #(T7)
               # <weakref at 0x401f0c0c; to 'instance' at 0x401f16ec>
print y.xobj()          # <__main__.X instance at 0x401f16ec>      #(T8)

print x.id              # 1                                        #(T9)
print y.id              # 1                                       #(T10)
print x.yobj.id         # 1                                       #(T11)
#print y.xobj.id                                                  #(T12)
print y.xobj().id       # 1                                       #(T13)

x = None                                                          #(T14)
y = None                                                          #(T15)

while(1): pass                                                    #(T16)
