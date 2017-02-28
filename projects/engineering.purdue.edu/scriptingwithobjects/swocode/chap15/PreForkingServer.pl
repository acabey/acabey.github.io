#!/usr/bin/perl -w
use strict;

### PreForkingServer.pl

#--------------------------   main   ----------------------------------
use IO::Socket;                                                    #(A1)
use Fcntl ':flock';                                                #(A2)
use IO::File;                                                      #(A3)
use constant PIDFILE     =>  "/tmp/prefork.pid";                   #(A4)

my $LOG = 1;                                                       #(A5)

sub prefix {                                                       #(A6)
    my $now = localtime;                                           #(A7)
    "[$now] [$$] " . shift;                                        #(A8)
}

$SIG{__WARN__} = sub { warn prefix shift };                        #(A9)
$SIG{__DIE__} = sub { die prefix shift };                         #(A10)
setup_signals();                                                  #(A11)

my $SLAVE_COUNT = 3;                                              #(A12)

my %kids;                                                         #(A13)
my $master_server_socket =IO::Socket::INET->new(LocalPort => 9000,#(A14)
                                                Listen => 1,      #(A15)
                                                Reuse => 1,       #(A16)
                                                Proto => 'tcp',   #(A17)
                                             )
or die "Cannot create master server socket: $!";                  #(A18)

for ( 1..$SLAVE_COUNT ) {                                         #(A19)
    $kids{ fork_a_slave( $master_server_socket ) } = "slave";     #(A20)
}

dead_process_cleanup_and_replacement();                           #(A21)


#----------------------  support functions  ---------------------------
sub fork_a_slave {                                                 #(B1)
    my $master_server_socket = shift;                              #(B2)
    my $pid;                                                       #(B3)
    defined ($pid = fork) or die "Cannot fork: $!";                #(B4)
    # The child receives a copy of the master server socket
    child_server($master_server_socket) unless $pid;               #(B5)
    $pid;                                                          #(B6)
}
sub dead_process_cleanup_and_replacement {                         #(C1)
    while (1) {                                                    #(C2)
        my $pid = wait;                                            #(C3)
        my $was = delete ($kids{$pid}) || "?unknown?";             #(C4)
        warn("child $pid ($was) terminated status $?") if $LOG;    #(C5)
        if ($was eq "slave") {                                     #(C6)
            sleep 1;                                               #(C7)
            warn "replacing a terminated process with a new one";  #(C8)
            $kids{ fork_a_slave($master_server_socket) } = "slave";#(C9)
        }
    }
}
sub child_server {                                                 #(D1)
    my $copy_of_master_server_socket = shift;                      #(D2)
    my $fh = IO::File->new(PIDFILE, O_RDWR | O_CREAT )             #(D3)
            or die "cant open lock file: $!";                      #(D4)
    warn "child started" if $LOG;                                  #(D5)
    flock $fh, LOCK_EX;                                            #(D6)
    warn("child has lock") if $LOG;                                #(D7)
    my $client_soc = $copy_of_master_server_socket->accept         #(D8)
                                    or die "accept: $!";           #(D9)
    warn "child releasing lock" if $LOG;                          #(D10)
    flock $fh, LOCK_UN;                                           #(D11)
    my @start_times = (times, time);                              #(D12)
    $client_soc->autoflush(1);                                    #(D13)
    warn("connect from ", $client_soc->peerhost) if $LOG;         #(D14)
    handle_io_with_client( $client_soc );                         #(D15)
    if ($LOG) {                                                   #(D16)
        my @finish_times = (times, time);                         #(D17)
        for (@finish_times) {                                     #(D18)
            $_ -= shift @start_times; 
        }                                                          
        warn(sprintf "TIMES: %.2f %.2f %.2f %.2f %d\n", 
                                      @finish_times);             #(D19)
    }
    warn("child terminating") if $LOG;                            #(D20)
    exit 0;                                                       #(D21)
}
sub handle_io_with_client {                                        #(E1)
    my $client_sock = shift;                                       #(E2)
    print $client_sock "Enter your cyberspace name:";              #(E3)
    my $client_name = <$client_sock>;                              #(E4)
    $client_name =~ s/^\s*(\S.*\S)\s*\n?$/$1/;                     #(E5)
    print $client_sock "Hello $client_name\n";                     #(E6)
    while ( defined( my $mesg = <$client_sock> ) ) {               #(E7)
        print $client_sock "$client_name: $mesg\n";                #(E8)
    }                                                                
    $client_sock->close or warn $@;                                #(E9)
}
sub setup_signals {                                                #(F1)
    setpgrp;                                                       #(F2)
    $SIG{HUP} = $SIG{INT} = $SIG{TERM} = sub {                     #(F3)
        my $sig = shift;                                           #(F4)
        $SIG{$sig} = 'IGNORE';                                     #(F5)
        kill $sig, 0;                                              #(F6)
        die "killed by $sig";                                      #(F7)     
    };
}
