#!/usr/bin/env python

### SOAPClientProto.py

import SOAPpy                                                        #(A)

#proxy_server = SOAPpy.SOAPProxy("http://localhost:8080/")           

proxy_server = SOAPpy.SOAPProxy("http://localhost:8080/",            #(B)
                 namespace="urn:ACMEWebService",                     #(C)
                 soapaction="urn:ACMEWebService#SumAndDifference")   #(D)

SOAPpy.Config.debug = 1                                              #(E)

print proxy_server.sayHelloWorld()                                   #(F)
print proxy_server.hello()                                           #(G)
response = proxy_server.SumAndDifference( 5000, 6000 )               #(H)
print response.sum             # 11000                               #(I)
print response.difference      # -1000                               #(J)
