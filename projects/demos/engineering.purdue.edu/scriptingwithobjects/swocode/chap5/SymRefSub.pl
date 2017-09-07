#!/usr/bin/perl -w

# SymRefSub.pl

my $funct1 = "do_squares";                                            #(A)
my $funct2 = "do_cubes";                                              #(B)

# Dereferencing a symbolic reference to a subroutine:
&$funct1(30);                # 30 squared gives us 900                #(C)
print "\n";

# Dereference the symbolic reference with the the arrow operator:
$funct1->(35);               # 35 squared gives us 1225               #(D)
print "\n";

# Chain the two subroutines:
&$funct1(30)->(40);                                                   #(E)
             # 30 squared gives us 900 and 40 cubed gives us 64000 
print "\n";

# Use the arrow for the first subroutine call also:
$funct1->(30)->(40);                                                  #(F)
             # 30 squared gives us 900 and 40 cubed gives us 64000 

# Squares its arg but returns a reference to another subroutine:
sub do_squares {                                                      #(G)
    my ($arg) = shift;                                          
    my $result = $arg * $arg;
    print "$arg squared gives us $result";
    # The next statement returns a symbolic
    # reference to another subroutine
    return $funct2;                                                   #(H)
}                                        
    
# Cubes its argument:
sub do_cubes {                                                        #(I)
    my ($arg) = shift;
    my $result = $arg * $arg * $arg;
    print " and $arg cubed gives us $result\n";
}
