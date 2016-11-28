#!/usr/bin/perl -w

### SOAPDaemonServer.pl

use strict;
#use SOAP::Lite +trace;                                              #(A)
use SOAP::Transport::HTTP;                                           #(B)

# Don't want to die on 'Broken pipe' or Ctrl-C         
$SIG{PIPE} = $SIG{INT} = 'IGNORE';                                   #(C)

my $daemon = SOAP::Transport::HTTP::Daemon                           #(D)
              -> new( LocalAddr => 'localhost', LocalPort => 8080 )  #(E)
              -> dispatch_to( 'ACMEWebService' );                    #(F)

print "SOAP server started at ", $daemon->url, "\n";                 #(G)
$daemon->handle;                                                     #(H)

#---------  SOAP clients can call on the ACMEWebService class  ----------

package ACMEWebService;                                              #(I)

sub new {                                                            #(J)
    my $self = shift;                                                #(K)
    my $class = ref($self) || $self;                                 #(L)
    bless { _acemwebservice => shift } => $class;                    #(M)
}

sub hello {                                                          #(N)
    return "hello world from the soap daemon server";              
}

sub bye {                                                            #(O)
    return "goodbye, world from the soap daemon server";
}

sub SumAndDifference {                                               #(P)
    my ($self, $x, $y) = @_;
    return { "sum" => $x + $y, "difference" => $x - $y };
}
