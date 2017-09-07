#!/usr/bin/env python

###  MenuRadOptCheck.py

from Tkinter import *                 

mw = Tk()                                                            #(A)

text = Text( mw, width = 50 )                                        #(B)
text.pack()                                                          #(C)

menubar = Menu( mw )                                                 #(D)
mw.configure( menu = menubar )                                       #(E)

#----------------------  A Radiobutton Menu  --------------------------

# Build a drop-down menu consisting of radio buttons under
# the label "Choose_Color":

var = StringVar()                                                    #(F)
var.set( 'white' )                                                   #(G)
radiobutton_menu = Menu( menubar, tearoff = 0 )                      #(H)
radiobutton_menu.add( 'radiobutton',                                 #(I)
                      label = 'red',                                 #(J)
                      value = 'red',                                 #(K)
                      variable = var,                                #(L)
                      command = lambda: radio_set_bg(),              #(M)
                    )
radiobutton_menu.add( 'radiobutton',                                 #(N)
                      label = 'blue',                  
                      value = 'blue',                  
                      variable = var,                  
                      command = lambda: radio_set_bg(),
                    )
radiobutton_menu.add( 'radiobutton',                                 #(O)
                      label = 'green',                 
                      value = 'green',                 
                      variable = var,                  
                      command = lambda: radio_set_bg(),
                    )
radiobutton_menu.add( 'radiobutton',                                 #(P)
                      label = 'white',                   
                      value = 'white',                   
                      variable = var,                    
                      command = lambda: radio_set_bg(),  
                    )

menubar.add_cascade( label = "Choose_Color",                         #(Q)
                     menu = radiobutton_menu,                        #(R)
                   )             

#----------------------  A Checkbutton Menu  --------------------------

# A menu consisting of check buttons: 

var1, var2, var3 = IntVar(), IntVar(), IntVar()                      #(S)

checkbutton_menu = Menu( menubar, tearoff = 0 )                      #(T)
checkbutton_menu.add( 'checkbutton',                                 #(U)
                      label = 'one',                                 #(V)
                      onvalue = 1,                                   #(W)
                      offvalue = 0,                                  #(X)
                      variable = var1,                               #(Y)
                      command = lambda: print_nums(),                #(Z)
                    )
checkbutton_menu.add( 'checkbutton',                                 #(a)
                      label = 'two',                      
                      onvalue = 2,                        
                      offvalue = 0,                       
                      variable = var2,                    
                      command = lambda: print_nums(),     
                    )
checkbutton_menu.add( 'checkbutton',                                 #(b)
                      label = 'three',                    
                      onvalue = 3,                        
                      offvalue = 0,                       
                      variable = var3,                    
                      command = lambda: print_nums(),     
                    )
menubar.add_cascade( label = "Choose_Numbers",                       #(c)
                     menu = checkbutton_menu,                        #(d)
                   )

#-----------------   A Optionmenu at the bottom  ------------------------

# Set up an option menu at the bottom of the GUI:

color_option = StringVar()                                           #(e)
color_option.set( 'cyan' )                                           #(f)
option_menu = OptionMenu(mw, color_option, 'cyan','yellow','magenta',
                         command = lambda e: option_changed() )      #(g)
option_menu.pack()                                                   #(h)


#-------------------------  callbacks  ---------------------------------

def option_changed():                                                #(i)
    global color_option                                              #(j)
    mw.configure( background = color_option.get() )                  #(k)

def radio_set_bg():                                                  #(l)
    global text, var                                                 #(m)
    text.configure( background = var.get() )                         #(n)
    text.insert('end', "value of %s: %s\n" % ("var", var.get()) )    #(o)
    
def print_nums():                                                    #(p)
    global text, var1, var2, var3                                    #(q)
    text.insert( 'end', "var1=%d  var2=%d var3=%d\n"                 
                         % (var1.get(), var2.get(), var3.get() ) )   #(r)

mainloop()                                                           #(s)
