#!/usr/bin/env python

### GetKeySym.py

from Tkinter import * 

mw = Tk()                                                            #(A)
mw.title( "Testing Callback" )                                       #(B)       
mw.bind( '<KeyPress>', lambda e: get_key_info(e) )                   #(C)

def get_key_info(event):                                             #(D)
    (key_sym_name, key_num ) = (event.keysym, event.keysym_num)      #(E)
    print "keysym=%s, numeric=%s\n" % (key_sym_name, key_num)        #(F)

mainloop()                                                           #(G)
