#!/usr/bin/env python

### StringOps.py

s = "abracadabra"                                                   #(A)  

# The 'in' and 'not in' operators:
print "bra" in s                       # True                       #(B)
print "bra" not in s                   # False                      #(C)

# String concatenation and replication:
print "hello" + "jello" + str( 123 )   # hellojello123              #(D)
print "hello" * 3                      # hellohellohello            #(E)

# The subscripting and slicing operators:
x = "hello"                                                         #(F)
print x[1]                             # e                          #(G)
print x[1:]                            # ello                       #(H)
print x[:3]                            # hel                        #(I)
print x[1:4:2]                         # el                         #(J)
#x[0] = "j"                            # WRONG                      #(K)

# Anciliary functions:
print len(x)                           # 5                          #(L)
print min(x)                           # e                          #(M)
print max(x)                           # o                          #(N)

# String predicates:
w = "abc" + str(123)                                                #(O)
print w                                # abc123
print w.isalnum()                      # True                       #(P)
print w.isalpha()                      # False                      #(Q)
print w.islower()                      # True                       #(R)
print w.find( "12" )                   # 3                          #(S)
print w.find( "45" )                   # -1                         #(T)
print w.endswith( "123" )              # True                       #(U)
print w.replace( "123", "def" )        # abcdef                     #(V)
print w.upper()                        # ABCDEF                     #(W)

# String splitting and joining:
print "pel mel    del".split()         # ['pel', 'mel', 'del']      #(X)
print x.split( 'l' )                   # ['he', '', 'o']            #(Y)
print ' '.join( ('hi', 'fi', 'xi') )   # hi fi xi                   #(Z)
y = "jello"                                                         #(a)
z = 123                                                             #(b)
print y.join( str(z) )                 # 1jello2jello3              #(c)

# To strip off trailing newlines:
x = "abcdefghi\n\n\n\n\n"                                           #(d)
print x.rstrip( "\n" )                 # abcdefghi                  #(e)

# To strip off trailing whitespace:
x = "abcdefghi          "                                           #(f)
print x.rstrip()                       # abcdefghi                  #(g)
print len( x.rstrip() )                # 9                          #(h)

# Boolean string comparison:
if (x < y): print 'hello is less than jello'                        #(i)
                                       # hello is less than jello
# Three-valued string comparison:
if ( cmp(x, y) ): print 'hello is less than jello'                  #(j)
                                       # hello is less than jello
# Single-quoted empty string:
empty1 = ''                                                         #(k)
if (not empty1): print 'empty1 is an empty string'                  #(l)
                                       # empty1 is an empty string
# Double-quoted empty string:
empty2 = ""                                                         #(m)
if (not empty2): print 'empty2 is an empty string'                  #(n)
                                       # empty2 is an empty string
# Triple-quoted empty string:
multiline = """"""                                                  #(o)
if (not multiline): print 'multiline is an empty string'            #(p)
                                       # multiline is an empty string

# Compile time string concatenation:
x =  ('hi!'                            # single-quoted              #(q)
      "how"                            # double-quoted              #(r)
      '''are'''                        # triple-quoted              #(s)
      """you""")                       # triple-quoted also         #(t)
print x                                # hi!howareyou               #(u)

del x                                                               #(v)
#print x                               # WRONG                      #(w)
