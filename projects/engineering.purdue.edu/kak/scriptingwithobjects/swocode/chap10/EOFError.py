#!/usr/local/bin/python

# EOFError.py

while True:                                                         #(A)
    try:                                                            #(B)
        name = raw_input( "enter your name: " )                     #(C)
        if ( (name == "") or (not name[0].isalpha()) ):             #(D)
            print "\nThat was an illegal entry. ",                  #(E)
        else: break                                                 #(F)
    except EOFError:                                                #(G)
        print "\nThat was an illegal entry. ",                      #(H)

print "you entered your name as: ", name                            #(I)


#print fileinput.input()


#import fileinput

#for line in fileinput.input():
#    print fileinput.filename(), fileinput.lineno(), ': ', line,



#for i in xrange(20):
#    line = fileinput.input()
#    print str(line)


#
#
#import sys                                                          #(A)
#
#file = open( "record.txt" )
#
##while True:
#for i in xrange(20):
#    char = file.read(100)
#    print char,
#
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
