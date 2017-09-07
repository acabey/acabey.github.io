#!/usr/bin/env python

###  RetrieveFromMyFriendsDB.py

import sys                                                           #(A)
import MySQLdb                                                       #(B)

try:                                                                 #(C)
    conn = MySQLdb.connect( host='localhost',                   
                            user='kak',
                            passwd='avikak',
                            db='MyFriends')                          #(D)
except MySQLdb.Error, e:                                             #(E)
    print "Unable to connect to database. Error %d: %s" % \
                                  (e.args[0], e.args[1])             #(F)
    sys.exit(1)                                                      #(G)
    
try:                                                                 #(I)
    cursor = conn.cursor()                                           #(J)

    cursor.execute( "SHOW TABLES" )      # Friends                   #(K)
                                         # Rovers
    result = cursor.fetchall()                                       #(L)
    for record in result:                                            #(M)
        print "%s" % record[0]                                       #(N)

    cursor.execute("SELECT Friends.Name, Friends.Phone FROM Friends")#(O)
    result = cursor.fetchall()                                       #(P)
    for record in result:                                            #(Q)
        print "%s\t%s" % (record[0], record[1])                      #(R)
                                         # Ziggy Zaphod    4569876
                                         # Yo Yo Ma        3472828
                                         # Gogo Gaga       27278927

    cursor.execute("SELECT Friends.Name, Rovers.RovingTime \
           FROM Friends, Rovers WHERE Friends.Name = Rovers.Name" )  #(S)
    result = cursor.fetchall()                                       #(T)
    for record in result:                                            #(U)
        print "%s\t%s" % (record[0], record[1])                      #(V)
                                         # Yo Yo Ma      8 pm
    cursor.close()                                                   #(W)

except MySQLdb.ProgrammingError, e:                                  #(X)
    print "Possible SQL Syntax Error %d: %s" % (e.args[0], e.args[1])#(Y)
except MySQLdb.Error, e:                                             #(Z)
    print "Error %d: %s" % (e.args[0], e.args[1])                    #(a)
    sys.exit(1)                                                      #(b)
    
conn.close()                                                         #(c)
