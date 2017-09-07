#!/usr/bin/env python

###  DrawArt.py

from Tkinter import *                    
import sys

mw = Tk()                                                            #(A)
mw.title( "Art Nouveau" )                                            #(B)
mw.configure( height = 650, width = 600 )                            #(C)
mw.resizable( 0, 0 )                                                 #(D)

canvas = Canvas( mw,                                                 #(E)
                 height = 600,                                       #(F)
                 width = 600,                                        #(G)
                 cursor = "crosshair" )                              #(H)
canvas.pack( side = 'top' )                                          #(I)

frame = Frame(mw)                                                    #(J)
frame.pack( side = 'bottom' )                                        #(K)
Button( frame,                                                       #(L)
        text = 'Save',                                               #(M)
        command = lambda: canvas.postscript( file = "picture.ps")    #(N)
      ).pack( side = 'left' )                                        #(O)
Button( frame,                                                       #(P)
        text = 'Exit',                                               #(Q)
        command = lambda: sys.exit(0),                               #(R)
      ).pack( side = 'right' )                                       #(S)

drawEnable = 0                                                       #(T)
startX = None                                                        #(U)
startY = None                                                        #(V)

canvas.bind( "<Button-1>", lambda e: drawingControl( e ) )           #(W)

# Turn drawing on and off with consecutive clicks of the
# left button of the mouse
def drawingControl( evt ):                                           #(X)
    global drawEnable, startX, startY                                #(Y)
    drawEnable = (drawEnable + 1) % 2                                #(Z)
    if not drawEnable:                                               #(a)
        canvas.bind( "<Motion>", lambda e: "break" )                 #(b)
    else:                                                            #(c)
        canv = evt.widget                                            #(d)
        startX, startY = evt.x, evt.y                                #(e)
        print "Button pressed at: x=%s  y=%s\n" % (startX, startY)   #(f)
        canv.bind( "<Motion>", lambda e: draw( e ) )                 #(g)

def draw( evt ):                                                     #(h)
    global startX, startY                                            #(i)
    canv, x, y = evt.widget, evt.x, evt.y                            #(j)
    canv.create_arc( startX, startY, x, y,                           #(k)
                               width = 4, fill = 'red' )             #(l)
    startX, startY = x, y                                            #(m)

mainloop()                                                           #(n)
