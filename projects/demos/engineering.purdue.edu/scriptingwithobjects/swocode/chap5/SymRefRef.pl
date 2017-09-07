#!/usr/bin/perl

# SymRefRef.pl

my $file = "datafile.txt";                                            #(A)

open FILE, $file                                                       
    or die "Can't open $file: $!";                                    #(B)

my $animal_category;                                                  #(C)
my @all_animal_categories;                                            #(D)

while (<FILE>) {                                                      #(E)
    chomp;                                                            #(F)
    next if /^\s*$/;                                                  #(G)
    if (/^\s*([a-zA-Z_]\w*)\s*:/) {                                   #(H)
        $animal_category = $1;                                        #(I)
        push @all_animal_categories, $animal_category;                #(J)
    } 
    my $str = $';                                                     #(K)
    $str =~ s/^\s*//;                                                 #(L)
    push my @temp, split /\s*,?\s+/, $str;                            #(M)
    $$animal_category = \@temp;                                       #(N)
}

print "@all_animal_categories\n";                                     #(O)
                    # two_legged four_legged six_legged eight_legged

print "$two_legged\n";              # ARRAY(0x8057218)                #(P)
print "$four_legged\n";             # ARRAY(0x804b5f8)                #(Q)
print "$six_legged\n";              # ARRAY(0x8057074)                #(R)
print "$eight_legged\n";            # ARRAY(0x805c564)                #(S)

print "@$two_legged\n";             # man bird                        #(T)
print "@$four_legged\n";            # cat dog horse crab              #(U)
print "@$six_legged\n";             # spider springtail silverfish    #(V)
print "@$eight_legged\n";           # beetle mite tick                #(W)

print $two_legged->[0], "\n";       # man                             #(X)
print $four_legged->[1], "\n";      # dog                             #(Y)
print $six_legged->[2], "\n";       # silverfish                      #(Z)
