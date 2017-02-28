#!/usr/bin/perl -w

###  CreateMyFriendsDB.pl

use strict;
use DBI;                                                             #(A)

my $driver = 'mysql';                                                #(B)
my $user = 'kak';                                                    #(C)
my $database = 'MyFriends';                                          #(D)
my $host = 'localhost';                                              #(E)
my $password = "avikak";                                             #(F)

my $drh = DBI->install_driver( $driver );                            #(G)
print "Version of DBD mysql module:   ", $DBD::mysql::VERSION, "\n"; #(H)

$drh->func('dropdb', $database, $host, $user, $password, 'admin');   #(I)

$drh->func('createdb', $database, $host, $user, $password, 'admin')  #(J)
    or die "Cannot create new database: $DBI::errstr\n";             #(K)

my $dsn = "DBI:mysql:database=MyFriends; host=localhost";            #(L)

my $dbh = DBI->connect( $dsn, $user, $password,  
                          { RaiseError => 1, AutoCommit => 1 } );    #(M)

$dbh->do( "CREATE TABLE Friends ( Name CHAR(30) PRIMARY KEY, " .
                           "Phone INT, Email CHAR(30) )" );          #(N)
$dbh->do( "INSERT INTO Friends VALUES ( 'Ziggy Zaphod', " .
                           "4569876, 'ziggy\@sirius' )" );           #(O)
$dbh->do( "INSERT INTO Friends VALUES ( 'Yo Yo Ma', " .
                           "3472828, 'yoyo\@yippy' )" );             #(P)
$dbh->do( "INSERT INTO Friends VALUES ( 'Gogo Gaga', " .
                           "27278927, 'gogo\@garish' )" );           #(Q)

$dbh->do( "CREATE TABLE Rovers ( Name CHAR(30) NOT NULL, " .
                           "RovingTime CHAR(10) )" );                #(R)
$dbh->do( "INSERT INTO Rovers VALUES ( 'Dusty Dodo', '2 pm' )" );    #(S)
$dbh->do( "INSERT INTO Rovers VALUES ( 'Yo Yo Ma', '8 pm' )" );      #(T)
$dbh->do( "INSERT INTO Rovers VALUES ( 'Bebe Beaut', '6 pm' )" );    #(U)

$dbh->disconnect;                                                    #(V)
