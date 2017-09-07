#!/usr/bin/env python

### SOAPClientUsingWSDL.py

import SOAPpy                                                        #(A)

proxy_server = SOAPpy.WSDL.Proxy( 'ACMEWebService.wsdl' )            #(B)
result = proxy_server.hello()                                        #(C)
print result                                                         #(D)
