#!/usr/bin/env python

# EOFErrorNot.py



#import fileinput

#for line in fileinput.input():
#    print fileinput.filename(), fileinput.lineno(), ': ', line,



#for i in xrange(20):
#    line = fileinput.input()
#    print str(line)



file = open( "hello.txt" )                                          #(A)

for i in range(10):                                                #(B)
    char = file.read(1)                                             #(C)
    print "character at position ", i, ": ", char                   #(D)

file.close()                                                        #(E)

#
#    line = file.readline()
#    print line


#    try:
#        print "i = ", i
#        line = file.readline()
#        print line
#    except EOFError:
#        print "caught EOFError for i: ", i
#    except IOError, e:
#        print "caught IOError for i: ", i
##        print e
#
