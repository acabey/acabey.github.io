#!/usr/bin/env python

### XMLRPC_ClientForCGIServer.py

import xmlrpclib

server_url = 'http://localhost/cgi-bin/XMLRPC_CGIServerInPython.cgi' #(A)
server = xmlrpclib.ServerProxy( server_url )                         #(B)

#print server.ACMEWebService.sumAndDifference( 5, 3 )
print server.sumAndDifference( 5, 3 )                                #(C)
                              # {'sum': 8, 'difference': 2}            
print server.sayHello()                                              #(D)
               # hello world from the Python CGI XML-RPC server
print server.bye()                                                   #(E)
               # goodbye world from the Python CGI XML-RPC server
