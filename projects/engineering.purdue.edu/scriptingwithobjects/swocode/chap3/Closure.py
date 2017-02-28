#!/usr/bin/python

### Closure.py

def make_greeting_generator( whom ):                                #(A)
    def greeting_generator( greeting ):                             #(B)
        print greeting, whom                                        #(C)
    return greeting_generator                                       #(D)

greeting_gen1 = make_greeting_generator( 'world' )                  #(E)
greeting_gen2 = make_greeting_generator( 'everyone' )               #(F)

greeting_gen1('hello')                # hello world                 #(G)
greeting_gen1('good morning')         # good morning world          #(H)

greeting_gen2('hello')                # hello everyone              #(I)
greeting_gen2('good morning')         # good morning everyone       #(J)
