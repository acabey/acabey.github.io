#!/usr/bin/env python

### GetEventDescriptors.py

from Tkinter import *                                                #(A)

mw = Tk()                                                            #(B)
b = Button( mw )                                                     #(C)

print "All system-supplied event descriptors for\n" +  \
"the Button class:\n"
print "\n".join( b.bind_class( b.winfo_class() ) ) + "\n\n"          #(D)    

def foo(): pass

# Declare additional event descriptors for the Button class:
b.bind_class( 'Button', '<Button-2>', foo )                          #(E)
b.bind_class( 'Button', '<ButtonRelease-2>', foo )                   #(F)
print "All event descriptors defined for Button class\n" + \
"including the new ones:\n"
print "\n".join( b.bind_class( b.winfo_class() ) ) + "\n\n"          #(G)    

# Declare event descriptors for a specific button instance:
b.bind( '<Button-3>', foo)                                           #(H)
b.bind( '<Button-4>', foo )                                          #(I)
b.bind( '<Button-5>', foo )                                          #(J)
b.bind( '<ButtonRelease-3>', foo )                                   #(K)
b.bind( '<ButtonRelease-4>', foo )                                   #(L)
b.bind( '<ButtonRelease-5>', foo )                                   #(M)

print "\nAll user-defined event descriptors\n" +   \
"for this specific button:\n"
print "\n".join( b.bind() ) + "\n\n"                                 #(N)    
