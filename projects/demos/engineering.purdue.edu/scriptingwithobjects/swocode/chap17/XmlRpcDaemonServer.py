#!/usr/bin/env python

### XmlRpcDaemonServer.py

import SimpleXMLRPCServer                                            #(A)

def sumAndDifference( arg1, arg2 ):                                  #(B)
    return { 'sum' : arg1 + arg2, 'difference' : arg1 - arg2 }       #(C)

def sayHello( sender ):                                              #(D)
    return "Hello to %s from an XML-RPC daemon server" % sender      #(E)

server = SimpleXMLRPCServer.SimpleXMLRPCServer(('localhost', 8080))  #(F)

server.register_function( sumAndDifference )                         #(G)
server.register_function( sayHello )                                 #(H)
server.register_introspection_functions()                            #(I)

server.serve_forever()                                               #(J)
