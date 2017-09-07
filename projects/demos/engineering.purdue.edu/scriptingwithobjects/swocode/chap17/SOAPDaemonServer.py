#!/usr/bin/env python

### SOAPDaemonServer.py

import SOAPpy                                                        #(A)

class ACMEWebService:                                                #(B)
    def hello(self):                                                 #(C)
       return "hello world from ACMEWebService " +  \
                 "of the stand-alone SOAP daemon server"             #(D)
    def bye(self):                                                   #(E)
        return "goodbye, world from the soap daemon server"          #(F)
    def SumAndDifference(self, arg1, arg2 ):                         #(G)
        return { "sum" : arg1 + arg2, "difference" : arg1 - arg2 }   #(H)

def sayHelloWorld():                                                 #(I)
    return "Hello World from a stand-alone SOAP Daemon Server"       #(J)

server = SOAPpy.SOAPServer(("localhost", 8080), \
                           namespace="urn:ACMEWebService")           #(K)

server.registerObject(ACMEWebService())                              #(L)
server.registerFunction(sayHelloWorld)                               #(M)
server.serve_forever()                                               #(N)
