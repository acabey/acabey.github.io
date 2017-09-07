#!/usr/bin/perl -w

# ContextDependency.pl

#Read one line at a time:

@ARGV = qw/data1.txt data2.txt/;                                   #(A)

while ( my $line = <> ) {           # scalar context for <>        #(B)
    print $line;                                                   #(C)
}                                   # hello
                                    # jello yello
                                    # mello

#Read all lines all at once:

#Reinitialize @ARGV:
@ARGV = qw/data1.txt data2.txt/;                                   #(D)

chomp( my @all_data = <> );         # list context for <>          #(E)

print "@all_data";                  # hello jello yello mello      #(F)
