#!/usr/bin/perl

# SymRef.pl

my $file = "datafile.txt";                                            #(A)    

open FILE, $file                                                       
    or die "Can't open $file: $!";                                    #(B)

my $animal_category;                                                  #(C)
my @all_animal_categories;                                            #(D)

while (<FILE>) {                                                      #(E)
    chomp;                                                            #(F)
    next if /^\s*$/;                    # ignore blank lines          #(G)
    if (/^\s*([a-zA-Z_]\w*)\s*:/) {     # extract animal cetegory     #(H)
        $animal_category = $1;                                        #(I)
        push @all_animal_categories, $animal_category;                #(J)
    } 
    my $str = $';                                                     #(K)
    $str =~ s/^\s*//;                                                 #(L)
    push @$animal_category, split /\s*,?\s+/, $str;                   #(M)
}

print "@all_animal_categories\n";                                     #(N)
                    # two_legged four_legged six_legged eight_legged

print "@two_legged\n";              # man bird                        #(O)
print "@four_legged\n";             # cat dog horse crab              #(P)
print "@six_legged\n";              # spider springtail silverfish    #(Q)
print "@eight_legged\n";            # beetle mite tick                #(R)

print "@{$all_animal_categories[0]}\n";            # man bird         #(S)
print scalar(@{$all_animal_categories[0]}), "\n";  # 2                #(T)

print "@{$all_animal_categories[3]}\n";            # beetle mite tick #(U)
print scalar(@{$all_animal_categories[3]}), "\n";  # 3                #(V)
