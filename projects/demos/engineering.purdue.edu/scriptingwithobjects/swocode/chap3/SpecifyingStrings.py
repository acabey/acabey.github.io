#!/usr/bin/python

### SpecifyingStrings.py

#Embedded '\n' causes newlines
#in the output in all cases:
print 'hi! \nhow are you'                 # hi!                     #(A)
                                          # how are you

print "hi! \nhow are you"                 # hi!                     #(B)
                                          # how are you  

print '''hi! \nhow are you'''             # hi!                     #(C)
                                          # how are you  

print """hi! \nhow are you"""             # hi!                     #(D)
                                          # how are you  

#Tab works for all cases:
print 'name\tage\tweight'                 # name    age     weight  #(E)
print "name\tage\tweight"                 # name    age     weight  #(F)
print '''name\tage\tweight'''             # name    age     weight  #(G)
print """name\tage\tweight"""             # name    age     weight  #(H)

#Only triple-quoted strings are
#allowed to be specified in
#multiple lines:
print '''hi!            
  how are you'''                          # hi!                 
                                          #   how are you           #(I)
print """hi!            
  how are you"""                          # hi!                 
                                          #   how are you           #(J)

#Single-quoted strings can include
#embedded double quotes:
print 'I "am" okay!'                      # I "am" okay!            #(K)

#Double-quoted strings can include
#embedded single quotes:
print "I 'am' okay!"                      # I 'am' okay!            #(L)

#Triple-quoted strings can include
#embedded single and double quotes:
print '''I 'am' "okay"!'''                # I 'am' "okay"!          #(M)
print """I 'am' "okay"!"""                # I 'am' "okay"!          #(N)

#Triple-quoted strings can also
#triple quotes using the other
#quote mark:
print '''I """am""" okay!'''              # I """am""" okay!        #(O)
print """I '''am''' okay!"""              # I '''am''' okay!        #(P)

#Backslashes when not used for
#character escapes show up as
#backslashes:
print 'C:\My Files\Cats\Temp'             # C:\My Files\Cats\Temp   #(Q)
print "C:\My Files\Cats\Temp"             # C:\My Files\Cats\Temp   #(R)
print '''C:\My Files\Cats\Temp'''         # C:\My Files\Cats\Temp   #(S)
print """C:\My Files\Cats\Temp"""         # C:\My Files\Cats\Temp   #(T)

#This does NOT give us two 
#backslashes together:
print 'C:\\My Files\Cats\Temp'            # C:\My Files\Cats\Temp   #(U)
print "C:\\My Files\Cats\Temp"            # C:\My Files\Cats\Temp   #(V)
print '''C:\\My Files\Cats\Temp'''        # C:\My Files\Cats\Temp   #(W)
print """C:\\My Files\Cats\Temp"""        # C:\My Files\Cats\Temp   #(X)

#But this does:
print 'C:\\\My Files\Cats\Temp'           # C:\\My Files\Cats\Temp  #(Y)
print "C:\\\My Files\Cats\Temp"           # C:\\My Files\Cats\Temp  #(Z)
print '''C:\\\My Files\Cats\Temp'''       # C:\\My Files\Cats\Temp  #(a)
print """C:\\\My Files\Cats\Temp"""       # C:\\My Files\Cats\Temp  #(b)

#However, this is a safer way if
#you want two backslashes together:
print 'C:\\\\My Files\Cats\Temp'          # C:\\My Files\Cats\Temp  #(c)
print "C:\\\\My Files\Cats\Temp"          # C:\\My Files\Cats\Temp  #(d)
print '''C:\\\\My Files\Cats\Temp'''      # C:\\My Files\Cats\Temp  #(e)
print """C:\\\\My Files\Cats\Temp"""      # C:\\My Files\Cats\Temp  #(f)

#Backslash used to escape the
#special meaning of the string
#delimiter quote mark:
print 'Trillian\'s puppy'                 # Trillian's puppy        #(g)
print "Z's love: \"Trillian\""            # Z's love: "Trillian"    #(h)
print '''Trillian\'s puppy'''             # Trillian's puppy        #(i)
print """Z's love: \"Trillian\""""        # Z's love: "Trillian"    #(j)

#Numeric escapes work as expected
#in all cases:
print '\x68\x69! \x68\x6F\x77 \141\162\145 you'                     #(k)
                                          # hi! how are you      
print "\x68\x69! \x68\x6F\x77 \141\162\145 you"                     #(l)
                                          # hi! how are you      
print '''\x68\x69! \x68\x6F\x77 \141\162\145 you'''                 #(m)
                                          # hi! how are you      
print """\x68\x69! \x68\x6F\x77 \141\162\145 you"""                 #(n)
                                          # hi! how are you      

#Specifying raw ASCII strings:
print r'hi! \nhey \there'                 # hi! \nhey \there        #(o)
print r"hi! \nhow \there"                 # hi! \nhey \there        #(p)
print r'''hi! \nhey \there'''             # hi! \nhey \there        #(q)
print r"""hi! \nhey \there"""             # hi! \nhey \there        #(r)

#Specifying a Unicode string:
print u"hi! \nhey \there"                 # hi!                     #(s)
                                          # hey     here
#Specifying a Unicode raw string:
print ur'hi! \nhey \there'                # hi! \nhey \there        #(t)

#Specifying a Unicode multiline
#string:
print u'''hi!            
  all done.'''                            # hi!                 
                                          #   all done.             #(u)
