#!/usr/bin/perl -w
use strict;

### TestCSV.pl

die "needs one command line arg, the name of the database file"
    unless @ARGV == 1;                                               #(A)
use CSV;                                                             #(B)
my $db = CSV->new( $ARGV[0] );                                       #(C)
$db->populate_database_from_disk_file;                               #(D)
$db->show_schema;                                                    #(E)
$db->retrieve_column( 2 );                                           #(F)
$db->show_row_for_last_name( "smythe" );                             #(G)
$db->retrieve_row( 2 );                                              #(H)
$db->enter_new_record_from_terminal( "anna","polly",
                         "home economics","sunshine university",
                         "perfectville","X74 987 0909");             #(I)
$db->retrieve_row( 5 );                                              #(J)
$db->interactive;                                                    #(K)
