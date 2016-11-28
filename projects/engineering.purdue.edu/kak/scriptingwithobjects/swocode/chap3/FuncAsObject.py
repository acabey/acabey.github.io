#!/usr/bin/python

# FuncAsObject.py

def foo(x, y):                                                         #(A)
    print max( x , y )                                                 #(B)

bar = foo                                                              #(C)
bar( 3, 4 )                            # 4                             #(D)

baz = bar                              # 8                             #(E)
baz( 8, 7 )                                                            #(F)

myfuncs = [foo, bar, baz]                                              #(G)

for item in myfuncs:                                                   #(H)
    item( 2, 3 )                                                       #(I)
                                       # 3
                                       # 3
                                       # 3

print foo                              # <function foo at 0x804f664>   #(J)
print bar                              # <function foo at 0x804f664>   #(K)
print baz                              # <function foo at 0x804f664>   #(L)

print type( foo )                      # <type 'function'>             #(M)
print type( bar )                      # <type 'function'>             #(N)
print type( baz )                      # <type 'function'>             #(O)
