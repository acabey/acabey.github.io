#!/usr/bin/env python

### GetAllEventDescriptors.py

from Tkinter import *                    

mw = Tk()                                                            #(A)
b = Button( mw )                                                     #(B)

event_descriptors = set()                                            #(C)

for tag in b.bindtags():                                             #(D)
    event_descriptors |= set( b.bind_class( tag ) )                  #(E)

print "\n".join( event_descriptors )                                 #(F)    
