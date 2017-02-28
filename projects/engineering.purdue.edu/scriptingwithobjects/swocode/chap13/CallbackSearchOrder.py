#!/usr/bin/env python

### CallbackSearchOrder.py

from Tkinter import *                    

mw = Tk()                                                            #(A)
b = Button( mw )                                                     #(B)
b.pack()                                                             #(C)

mw.bind( '<Button>', lambda e: foo_tops() )                          #(D)
b.bind( '<Button>', lambda e: foo_butt() )                           #(E)
b.bind_class( 'Button', '<Button-1>', lambda e: foo_Butt() )         #(F)
b.bind_all( '<Button>', lambda e: foo_App() )                        #(G)

def foo_tops():  print "callback for Toplevel instance invoked"      #(H)
def foo_butt(): print "callback for Button instance invoked"         #(I)
def foo_Butt(): print "callback for Button class invoked"            #(J)
def foo_App(): print "callback for Application level invoked"        #(K)

mainloop()                                                           #(L)
