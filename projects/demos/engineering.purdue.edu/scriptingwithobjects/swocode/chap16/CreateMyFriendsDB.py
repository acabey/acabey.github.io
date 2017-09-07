#!/usr/bin/env python

###  CreateMyFriendsDB.py

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
    
conn.commit()                                                        #(H)

try:                                                                 #(I)
    cursor = conn.cursor()                                           #(J)
    
    cursor.execute( "SELECT VERSION()" )                             #(K)
    row = cursor.fetchone()                                          #(L)
    print row[0]                  # 4.1.10a-standard                 #(M)
    
    cursor.execute( 'DROP DATABASE IF EXISTS MyFriends' )            #(N)
    cursor.execute( 'CREATE DATABASE MyFriends' )                    #(O)
    cursor.execute( 'USE MyFriends' )                                #(P)
#   cursor.execute('DROP TABLE IF EXISTS Friends')                   #(Q)
#   cursor.execute('DROP TABLE IF EXISTS Rovers')                    #(R)

    # Create a new table called Friends and insert rows into it:
    cursor.execute( "CREATE TABLE Friends ( Name CHAR(30) PRIMARY KEY, " +
                               "Phone INT, Email CHAR(30) )" )       #(S)
    cursor.execute( "INSERT INTO Friends VALUES ( 'Ziggy Zaphod', " +
                               "4569876, 'ziggy\@sirius' )" )        #(T)
    cursor.execute( "INSERT INTO Friends VALUES ( 'Yo Yo Ma', " +
                               "3472828, 'yoyo\@yippy' )" )          #(U)
    cursor.execute( "INSERT INTO Friends VALUES ( 'Gogo Gaga', " +
                               "27278927, 'gogo\@garish' )" )        #(V)
    
    # Create a new table called Rovers and insert rows into it:
    cursor.execute( "CREATE TABLE Rovers ( Name CHAR(30) NOT NULL, " +
                               "RovingTime CHAR(10) )" )             #(W)
    cursor.execute( "INSERT INTO Rovers VALUES ('Dusty Dodo'," +
                                               " '2 pm')" )          #(X)
    cursor.execute( "INSERT INTO Rovers VALUES ('Yo Yo Ma'," +
                                               " '8 pm')" )          #(Y)
    cursor.execute( "INSERT INTO Rovers VALUES ('Bebe Beaut'," +
                                               " '6 pm')" )          #(Z)
    
    cursor.execute( "DESCRIBE Friends" )                             #(a)
    result = cursor.fetchall()                                       #(b)
    print result
    for record in result:                                            #(c)
        print "%s:\t%s" % (record[0], record[1])                     #(d)
    
    cursor.close()                                                   #(e)

except MySQLdb.ProgrammingError, e:                                  #(f)
    print "Possible SQL Syntax Error %d: %s" % (e.args[0], e.args[1])#(g)
except MySQLdb.Error, e:                                             #(h)
    print "Error %d: %s" % (e.args[0], e.args[1])                    #(i)
    sys.exit(1)                                                      #(j)
    
conn.close()                                                         #(k)
