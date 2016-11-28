#!/usr/bin/env python

###  PackGeom.py

from Tkinter import * 

mw = Tk()                                                            #(A)
mw.title( "Pack Layout" )                                            #(B)
mw.geometry( "400x200+50+100" )                                      #(C)
mw.maxsize( 400, 500 )                                               #(D)
mw.minsize( 100, 200 )                                               #(E)

#----------   Widget for the top side of the main window   --------------

def buttprint(): print "Good Morning to you!\n"                      #(F)

Button( mw,                                                          #(G)
        text = 'Click Here for a Greeting',                          #(H)
        anchor  = 'c',                                               #(I)
        relief  = 'raised',                                          #(J)
        command =  buttprint                                         #(K)
      ).pack( side = 'top', padx = 10, pady = 5 )                    #(L)


#---------   Widget for the bottom side of the main window   ------------

entry_var = "Hit <CR> and then enter text here followed by <CR>"     #(M)

entry_widget = Entry( mw,                                            #(N)
                      width = 42,                                    #(O)
                    )
entry_widget.insert(0, entry_var)                                    #(P)
entry_widget.pack( side = 'bottom' )                                 #(Q) 

def entryAction( event ):                                            #(R)
    input = entry_widget.get() + "\n"                                #(S)
    entry_widget.delete( 0, 'end' )                                  #(T)    
    print "User entered in entry widget: %s\n" % input               #(U)

entry_widget.bind( "<Return>", entryAction )                         #(V)


#----------   Widget for the left side of the main window   -------------

Label( mw,                                                           #(W)
       text    = 'hello',                                            #(X)
       anchor  = 'c',                                                #(Y)
       relief  = 'groove',                                           #(Z)
       width   = 10,                                                 #(a)
       height  = 2,                                                  #(b)
      ).pack( side = 'left', padx = 10, pady = 5 )                   #(c)


#----------   Widget for the right side of the main window   ------------

frame = Frame( mw )                                                  #(d)
scrollbar = Scrollbar( frame, orient = 'vertical' )                  #(e)
listbox = Listbox( frame,                                            #(f)
                   yscrollcommand = scrollbar.set,                   #(g)
                   selectmode = 'single',                            #(h)
                   width = 10,                                       #(i)
                   height = 3,                                       #(j)
                 )
scrollbar.config( command = listbox.yview )                          #(k)
scrollbar.pack( side = 'left', fill = 'y' )                          #(l)
listbox.pack( side = 'right', fill = 'both', expand = 1 )            #(m)
frame.pack( side = 'right' )                                         #(n)
listbox.insert( 'end', 'red', 'green', 'blue', 'magenta', 'pink' )   #(o)

def listBoxAction(event):                                            #(p)
    listbox.configure(background=listbox.get(listbox.curselection()))#(q)

listbox.bind( '<Double-Button-1>', listBoxAction )                   #(r)

mainloop()                                                           #(s)
