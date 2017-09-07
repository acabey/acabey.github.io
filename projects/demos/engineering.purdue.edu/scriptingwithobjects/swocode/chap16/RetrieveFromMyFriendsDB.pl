#!/usr/bin/perl -w

###  RetrieveFromMyFriendsDB.pl

use strict;
use DBI;                                                              #(A)

my $dsn = "DBI:mysql:database=MyFriends;host=localhost";              #(B)
my $dbh = DBI->connect( $dsn, 'kak', 'avikak',                 
			{ RaiseError => 1, AutoCommit => 1 }  );      #(C)
print "succesfully connected \n";

my $sth = $dbh->prepare( "SHOW TABLES" );                             #(D)
$sth->execute;                                                        #(E)
my $tables_ref = $sth->fetchall_arrayref();                           #(F)
print "\nNumber of tables: " . @$tables_ref . "\n";                   #(G)
my @tabarr = @$tables_ref;                                            #(H)
print "First table: ", @{$tabarr[0]}, "\n";                           #(I)
print "Second table: ", @{$tabarr[1]}, "\n";                          #(J)
$sth->finish;                                                         #(K)

$sth = $dbh->prepare( qq{SELECT Friends.Name, Friends.Phone 
                                                FROM Friends} );      #(L)
$sth->execute;                                                        #(M)
print "\nNames and phone numbers from the Friends table:\n";
while ( my @ary = $sth->fetchrow_array ) {                            #(N)
    for ( my $i = 0; $i < @ary; $i++ ) {                              #(O)
        printf( "%s%s", $i ? "\t" : "        ", $ary[$i] );           #(P)
    }
    print "\n";
}
print "\n\n";

$sth = $dbh->prepare( q{SELECT Friends.Name, Rovers.RovingTime 
           FROM Friends, Rovers WHERE Friends.Name = Rovers.Name} );  #(Q)
$sth->execute;                                                        #(R)
print "Friends who are also in the Rovers club:\n";
my $names = $sth->{ 'NAME' };                                         #(S)
my $numFields = $sth->{ 'NUM_OF_FIELDS' };                            #(T)
for ( my $i = 0; $i < $numFields; $i++ ) {                            #(U)
    printf( "%s%s", $i ? "\t\t" : "", $$names[$i] );                  #(V)
}
print "\n";
while ( my $ref = $sth->fetchrow_arrayref ) {                         #(W)
    for ( my $i = 0; $i < $numFields; $i++ ) {                        #(X)
        printf( "%s%s", $i ? "\t" : "", $$ref[$i] );                  #(Y)
    }
    print "\n";
}
$dbh->disconnect;                                                     #(Z)
