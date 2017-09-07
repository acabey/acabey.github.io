#!/usr/bin/env python

###  FirstWindow.py

from Tkinter import *                                                #(A)

mw = Tk()                                                            #(B)
mw.title( "My First Window" )                                        #(C)
mw.geometry( "200x150+50+100" );                                     #(D)
mw.maxsize(400, 500)                                                 #(E)
mw.minsize(100, 200)                                                 #(F)

label = Label( mw,                                                   #(G)
               text="hello",                                         #(H)
               anchor  = 's',                                        #(I)
               relief  = 'groove',                                   #(J)
               width  = 10,                                          #(K)
               height = 3  )                                         #(L)

label.pack( side = 'top',                                            #(M)
            padx = 10,                                               #(N)
            pady = 5 )                                               #(O)

mainloop()                                                           #(P)
