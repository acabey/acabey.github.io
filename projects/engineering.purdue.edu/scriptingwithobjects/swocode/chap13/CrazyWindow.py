#!/usr/bin/env python

###  CrazyWindow.py

import random
from Tkinter import *   

mw = Tk()                                                            #(A)
mw.title( "CrazyWindow" )                                            #(B)
scrollbar = Scrollbar( mw, orient = 'vertical' )                     #(C)
textWindow = Text( mw,                                               #(D)
                   width = 45,                                       #(E)
                   setgrid = 'true',                                 #(F)
                   yscrollcommand = scrollbar.set,                   #(G)
                 )
scrollbar.config( command = textWindow.yview )                       #(H)
scrollbar.pack( side = 'left', fill = 'y' )                          #(I)
textWindow.focus()                                                   #(J)
textWindow.pack( side = 'left' )                                     #(K)

drawWindow = Canvas( mw )                                            #(L)
drawWindow.pack( side = 'right',                                     #(M)
                 fill = 'y',                                         #(N)
                 expand = 1 )                                        #(O)

word = ''                                                            #(P)
ran = random.Random()                                                #(Q)

textWindow.bind( '<KeyPress>', lambda e: word_accumulator( e ) )     #(R)

def word_accumulator( evt ):                                         #(S)
    global word, ran                                                 #(T)
    keysym_text, keysym_decimal = evt.keysym, evt.keysym_num         #(U)
    if ( keysym_text != 'space' and keysym_text != 'Return' ):       #(V)
        word += keysym_text                                          #(W)
    else:                                                            #(X)
        x, y = ran.randint(0,280), ran.randint(0,300)                #(Y)
        if word == 'red' :                                           #(Z)
            drawWindow.create_rectangle( x, y, x+30, y+30,
                                         fill = 'red' )              #(a)
        elif word == 'blue' :                                        #(b)
            drawWindow.create_rectangle( x, y, x+30, y+30,
                                         fill = 'blue' )             #(c)
        elif word == 'brown':                                        #(d)
            drawWindow.create_rectangle( x, y, x+30, y+30,
                                         fill = 'brown' )            #(e)
        elif word == 'green':                                        #(f)
            drawWindow.create_rectangle( x, y, x+30, y+30,
                                         fill = 'green' )            #(g)
        elif word == 'black':                                        #(h)
            drawWindow.create_rectangle( x, y, x+30, y+30,
                                         fill = 'black' )            #(i)
        elif word == 'orange':                                       #(j)
            drawWindow.create_rectangle( x, y, x+30, y+30,
                                         fill = 'orange' )           #(k)
        elif word == 'yellow':                                       #(l)
            drawWindow.create_rectangle( x, y, x+30, y+30,
                                         fill = 'yellow' )           #(m)
        word = ''                                                    #(n)

mainloop()                                                           #(o)
