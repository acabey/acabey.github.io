#!/usr/bin/env python

###  CascadingMenu.py

from Tkinter import *                 

mw = Tk()                                                            #(A)
text = Text( mw, width = 50 )                                        #(B)
text.pack()                                                          #(C)

mbar = Menu( mw )                                                    #(D)
mw.configure( menu = mbar )                                          #(E)

# Two menu buttons for the menubar:
level_0_menu = Menu( mbar, tearoff = 1 )                             #(F)
mbar.add_cascade( label = "Level_0",                                 #(G)
                  menu = level_0_menu,                               #(H)
                  underline = 1)                                     #(I)
helpmenu = Menu( mbar, tearoff = 0 )                                 #(J)
mbar.add_cascade( label = "Help",                                    #(K)
                  menu = helpmenu,                                   #(L)
                  underline = 0)                                     #(M)

# The menu for the 'Help' menubutton in the menubar:
helpmenu.add_command( label = "About",                               #(N)
                      command = lambda: text.insert('end',           #(O)
             "Click on the Level_0 button to see a cascading menu")) #(P)

# The menu for the 'Level_0' menubutton in the menubar:
level_0_menu.add_command( label = "Exit",                            #(Q)
                          command = mw.quit );                       #(R)

level_1_menu = Menu( mbar, tearoff = 1 )                             #(S)
level_0_menu.add_cascade( label = "Level_1",                         #(T)
                          underline = 1,                             #(U)
                          menu = level_1_menu )                      #(V)

level_2_menu =  Menu( mbar, tearoff = 1 )                            #(W)
level_1_menu.add_cascade( label = "Level_2",                         #(X)
                          underline = 2,                             #(Y)
                          menu = level_2_menu )                      #(Z)

level_3_menu =  Menu( mbar, tearoff = 1 )                            #(a)
level_2_menu.add_cascade( label = "Level_3",                         #(b)
                          underline = 3,                             #(c)
                          menu = level_3_menu )                      #(d)

level_4_menu =  Menu( mbar, tearoff = 1 )                            #(e)
level_3_menu.add_cascade( label = "Level_4",                         #(f)
                          underline = 4,                             #(g)
                          menu = level_4_menu )                      #(h)
level_4_menu.add_command( label = "click here",                      #(i)
                          command = lambda: text.insert( 'end',      #(j)
                 "hello from the tail end of a cascaded menu\n" ) )  #(k)
mainloop()                                                           #(l)
