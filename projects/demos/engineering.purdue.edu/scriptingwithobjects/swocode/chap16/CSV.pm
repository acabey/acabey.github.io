package CSV;                                                         #(A)

### CSV.pm

use strict;                                                          #(B)

sub new {                                                           #(C1)
    my ($class, $db_file) = @_;                                     #(C2)
    bless {                                                         #(C3)
        _dbfile  => $db_file,                                       #(C4)
        _db => [],                                                  #(C5)
    }, $class;                                                      #(C6)
}

sub populate_database_from_disk_file {                              #(D1)
    my $self = shift;                                               #(D2)
    open FILE, $self->{_dbfile}
           or die "unable to open file: $!";                        #(D3)
    while (<FILE>) {                                                #(D4)
        chomp;                                                      #(D5)
        my @record = split /\,/, $_;                                #(D6)
        $self->enter_record_from_file( @record );                   #(D7)
    }                                                   
    close FILE;                                                     #(D8)
}

sub write_database_to_file {                                        #(E1)
    my $self = shift;                                               #(E2)
    my $file = $self->{_dbfile};
    open FILE, ">$file"
            or die "unable to open file: $!";                       #(E3)
    for my $i (0..@{$self->{_db}}-1) {                              #(E4)
        my $csv_string = join ',', @{$self->{_db}[$i]};             #(E5)
        print FILE "$csv_string\n";                                 #(E6)
    }
    close FILE;                                                     #(E7)
}

sub show_schema {                                                   #(F1)
    my $self = shift;                                               #(F2)
    my @schema = @{$self->{_db}[0]};                                #(F3)
    my $print_string = join "   ", @schema;                         #(F4)
    print "$print_string\n";                                        #(F5)
}

sub enter_record_from_file {                                        #(G1)
    my ($self, @entries) = @_;                                      #(G2)
    push @{$self->{_db}}, \@entries;                                #(G3)
}

sub enter_new_record_from_terminal {                                #(H1)
    my ($self, @entries) = @_;                                      #(H2)
    my $last_row_index = @{$self->{_db}} - 1;                       #(H3)
    unshift @entries, $last_row_index + 1;                          #(H4)
    push @{$self->{_db}}, \@entries;                                #(H5)
    $self->write_database_to_file;                                  #(H6)
}
    
sub retrieve_column {                                               #(J1)
    my ($self, $column_index) = @_;                                 #(J2)
    for my $i (1..@{$self->{_db}}-1) {                              #(J3)
        print "$self->{_db}[$i][$column_index]\n";                  #(J4)
    }
    print "\n";
}

sub retrieve_row {                                                  #(K1)
    my ($self, $row_index) = @_;                                    #(K2)
    print "@{$self->{_db}[$row_index]}\n";                          #(K3)
}

sub show_row_for_last_name {                                        #(L1)
    my ($self, $value) = @_;                                        #(L2)
    for my $i (1..@{$self->{_db}}-1) {                              #(L3)
        if ( $self->{_db}->[$i][1] eq $value ) {                    #(L4)
            for my $j (0..@{$self->{_db}[0]}-1) {                   #(L5)
                printf "%15s:  %s\n", $self->{_db}->[0][$j], 
                                      $self->{_db}->[$i][$j];       #(L6)
            }
            print "\n";
            return $i;                                              #(L7)
        }
    }
}

sub interactive {                                                   #(M1)
    my $self = shift;                                               #(M2)
    while (1) {                                                     #(M3)
        print "\nDo you wish to have an interactive session " .     
              "with the database?" .                          
              "\nEnter yes or no:  ";                               #(M4)
        if ( <STDIN> =~ /y(es)?/i ) {                               #(M5)
            print "\nLast names stored in the database:\n\n";       #(M6)
            $self->retrieve_column(1);                              #(M7)
            print "Whose record do you wish to view/change? ";      #(M8)
            my $last_name = <STDIN>;                                #(M9)
            chomp $last_name;                                      #(M10)
            print "\nHere is the record for this last name:\n\n";  #(M11)
            my $row_index = 
                     $self->show_row_for_last_name( $last_name );  #(M12)
            print "Do you wish to change this record?\n" .
                               "Enter yes or no: ";                #(M13)
            if ( <STDIN> =~ /y(es)?/i ) {                          #(M14)
                print "Old entry: ";                               #(M15)
                my $old_entry = <STDIN>;                           #(M16)
                chomp $old_entry;                                  #(M17)
                print "New entry: ";                               #(M18)
                my $new_entry = <STDIN>;                           #(M19)
                chomp $new_entry;                                  #(M20)
                for my $j (1..@{$self->{_db}[$row_index]}-1){      #(M21)
                    if ($self->{_db}[$row_index][$j] 
                                                   eq $old_entry){ #(M22)
                        $self->{_db}[$row_index][$j] = $new_entry; #(M23)
                    }
                }
            }  else { next; }                                      #(M24)
        } else { last; }                                           #(M25)
    }
    $self->write_database_to_file;                                 #(M26)
}

1
