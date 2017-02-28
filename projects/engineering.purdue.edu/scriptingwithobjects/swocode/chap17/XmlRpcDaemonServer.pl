#!/usr/bin/perl

### XmlRpcDaemonServer.pl

use Frontier::Daemon;                                                #(A)

sub sumAndDifference {                                               #(B)
    my ($x, $y) = @_;                                                #(C)
#    my $arrayref = shift;
#    my ($x, $y) = @$arrayref;
#    print "server x: $x   server y: $y\n";
    return {'sum' => $x + $y, 'difference' => $x - $y};              #(D)
}

sub sayHello {                                                       #(E)
    my $sender = shift;
    return "Hello to $sender from an XML-RPC daemon server\n";
}

$methods = {'sumAndDifference' => \&sumAndDifference,
            'sayHello'         => \&sayHello,
           };                                                        #(F)

# From local host, call me at http://localhost:8080/RPC2
# From a remote host, call me at http://128.46.144.238:8080/RPC2
Frontier::Daemon->new( LocalPort => 8080, 
                       methods => $methods,
                     )                                        
    or die "Couldn't start HTTP server: $!";                         #(G)
