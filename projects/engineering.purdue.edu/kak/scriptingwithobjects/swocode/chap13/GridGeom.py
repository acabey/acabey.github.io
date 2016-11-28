#!/usr/bin/env python

###  GridGeom.py

from Tkinter import * 

mw = Tk()                                                            #(A)
mw.title( "Grid Layout" )                                            #(B)

#---------------------   Widget for cell (0,0)  -------------------------

def buttprint(): print "Good Morning to you!\n"                      #(C)

Button( mw,                                                          #(D)
        text = 'Click Here for a Greeting',                          #(E)
        anchor  = 'c',                                               #(F)
        relief  = 'raised',                                          #(G)
        command =  buttprint                                         #(H)
      ).grid( row = 0,                                               #(I)
              column = 0,                                            #(J)
              padx = 60,                                             #(K)
              pady = 40 )                                            #(L)


#---------------------   Widget for cell (0,1)  -------------------------

entry_var = "Hit <CR> and then enter text here followed by <CR>"     #(M)

entry_widget = Entry( mw,                                            #(N)
                      width = 42,                                    #(O)
                    )
entry_widget.insert(0, entry_var)                                    #(P)
entry_widget.grid( row = 0,                                          #(Q)
                    column = 1,                                      #(R)
                    padx = 60 )                                      #(S)

def entryAction( event ):                                            #(T)
    input = entry_widget.get() + "\n"                                #(U)
    entry_widget.delete( 0, 'end' )                                  #(V)    
    print "User entered in entry widget: %s\n" % input               #(W)

entry_widget.bind( "<Return>", entryAction )                         #(X)


#---------------------   Widget for cell (1,0)  -------------------------

Label( mw,                                                           #(Y)
       text    = 'hello',                                            #(Z)
       anchor  = 'c',                                                #(a)
       relief  = 'groove',                                           #(b)
       width   = 10,                                                 #(c)
       height  = 2,                                                  #(d)
      ).grid( row = 1,                                               #(e)
        column = 0,                                                  #(f)
        pady = 40,                                                   #(g)
        sticky = "nsew",                                             #(h)
      )                          


#---------------------   Widget for cell (1,1)  -------------------------

frame = Frame( mw )                                                  #(i)
scrollbar = Scrollbar( frame, orient = 'vertical' )                  #(j)
listbox = Listbox( frame,                                            #(k)
                   yscrollcommand = scrollbar.set,                   #(l)
                   selectmode = 'single',                            #(m)
                   width = 10,                                       #(n)
                   height = 3,                                       #(o)
                 )
scrollbar.config( command = listbox.yview )                          #(p)
scrollbar.pack( side = 'left', fill = 'y' )                          #(q)
listbox.pack( side = 'right', fill = 'both', expand = 1 )            #(r)
frame.grid( row = 1, column = 1 )                                    #(s)
listbox.insert( 'end', 'red', 'green', 'blue', 'magenta', 'pink' )   #(t)

def listBoxAction(event):                                            #(u)
    listbox.configure(background=listbox.get(listbox.curselection()))#(v)

listbox.bind( '<Double-Button-1>', listBoxAction )                   #(w)

mainloop()                                                           #(x)
