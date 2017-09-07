#!/usr/bin/env python

### EventMethods.py

from Tkinter import *                                                #(A)

mw = Tk()                                                            #(B)
mw.title( "Testing Callback" )                                       #(C)       
mw.bind( '<KeyPress>', lambda e: testEventMethods() )                #(D)
b = Button( mw, text = "click here"  )                               #(E)
b.pack( side = 'top' )                                               #(F)
c = Canvas( mw )                                                     #(G)
c.pack( side = 'bottom' )                                            #(H)

mw.bind( '<KeyPress>', lambda e: testEventMethods( e ) )             #(I)
b.bind( '<Button>', lambda e: testEventMethods( e ) )                #(J)
c.bind( '<Button>', lambda e: testEventMethods( e ) )                #(K)

def testEventMethods( e ):                                           #(L)
    print "\n\nEvent object: %s" % e                                 #(M)
    print "Source widget (returned by e.widget): %s" % \
                                e.widget                             #(N)
    print "Source widget (returned by e.widget.winfo_name): %s" % \
                                e.widget.winfo_name()                #(O)
    if e.keysym_num != '??':                                         #(P)
        print "Key (ASCII only): %s" % e.keysym_num                  #(Q)
    else: print "Key (ASCII only):  "                                #(R)
    if e.keysym != '??':                                             #(S)
        print "Key (any): %s" % e.keysym                             #(T)
    else: print "Key (any): "                                        #(U)
    print "(x,y) coord relative to laptop screen: %s, %s" % \
                              (e.x_root, e.y_root)                   #(V)
    print "(x,y) coord relative to widget: %s, %s\n" %  (e.x, e.y)   #(W)

mainloop()                                                           #(X)
