#!/usr/bin/env python

### XmlRpcDaemonServerClient.py

import xmlrpclib                                                     #(A)

try:                                                                 #(B)
    server_url = 'http://localhost:8080/RPC2'                        #(C)
    server = xmlrpclib.ServerProxy( server_url )                     #(D)
    print server             # <ServerProxy for localhost:8080/RPC2> #(E)

#   print server.system.listMethods()                                #(F)
#   print server.system.methodSignature( 'sumAndDifference' )        #(G)

    sumAndDiff = server.sumAndDifference                             #(H)
    result = sumAndDiff( 5, 3 )                                      #(I)
    print result                 # {'sum': 8, 'difference': 2}       #(J)

    print server.sayHello( "Trillian" )                              #(K)
                 # Hello to Trillian from an XML-RPC daemon server

except xmlrpclib.ProtocolError, e:                                   #(L)
    print "Protocol Error: ", e                                      #(M)
except xmlrpclib.Fault, e:                                           #(N)
    print "XML-RPC Fault: ", e                                       #(O)
except Exception, e:                                                 #(P)
    print "Error: ", e                                               #(Q)
