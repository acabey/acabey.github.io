#!/usr/bin/env python

###  TwoMainWindows.py

from Tkinter import *                                                #(A)

mw1 = Tk()                                                           #(B)
mw1.title( "First Window" )                                          #(C)
mw1.geometry( "200x150+50+100" );                                    #(D)

mw2 = Tk()                                                           #(E)
mw2.title( "First Window" )                                          #(F)
mw2.geometry( "200x150+300+150" );                                   #(G)

def but1print(): print "hello from button 1"                         #(H)
def but2print(): print "hello from button 2"                         #(I)

Button( mw1,                                                         #(J)
        text = 'Click Here',                                         #(K)
        command = but1print                                          #(L)
      ).pack()                                                       #(M)

Button( mw2,                                                         #(N)
        text = 'Click Here',                                         #(O)
        command = but2print                                          #(P)
      ).pack()                                                       #(Q)

mainloop()                                                           #(R)
