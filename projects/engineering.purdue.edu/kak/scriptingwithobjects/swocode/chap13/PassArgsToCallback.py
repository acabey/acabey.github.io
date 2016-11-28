#!/usr/bin/env python

###  PassArgsToCallbacks.py

from Tkinter import *                    

mw = Tk()                                

b1 = Button( mw, text = "b1" )                                       #(A)
b2 = Button( mw, text = "b2" )                                       #(B)
b3 = Button( mw, text = "b3" )                                       #(C)
b4 = Button( mw, text = "b4" )                                       #(D)

b1.grid(row = 0, column = 0)                                         #(E)
b2.grid(row = 0, column = 1)                                         #(F)
b3.grid(row = 1, column = 0)                                         #(G)
b4.grid(row = 1, column = 1)                                         #(H)

# For the buttons b1 through b2, the callbacks need no arguments:
def says_b1(): print "b1 says hello to me\n"                         #(I)
def says_b2( e ): print "b2 says hello to me\n"                      #(J)
b1.configure( command =  says_b1 )                                   #(K)
b2.bind( '<Button-1>', says_b2 )                                     #(L)

# The callbacks for b3 and b4 need the following two as arguments:
arg1 = "hello"                                                       #(M)
arg2 = "to me"                                                       #(N)

# Register the callbacks:
b3.configure( command = lambda: saysomething_1( b3, arg1, arg2 ) )   #(O)
b4.bind( '<Button-1>', lambda e: saysomething_2( e, arg1, arg2 ) )   #(P)

def saysomething_1( wdg, p, q ):                                     #(Q)
    butt_lbl = wdg.cget( 'text' )                                    #(R)
    print "%s says %s %s\n" % (butt_lbl, p, q)                       #(S)

def saysomething_2( evt, p, q ):                                     #(T)
    butt_lbl = evt.widget.cget( 'text' )                             #(U)
    print "%s says %s %s\n" % (butt_lbl, p, q)                       #(V)

mainloop()                                                           #(W)
