#!/usr/bin/perl -w

### Integer.pl

#$num = 0x7f_ff_ff_ff;            # max for signed 4-byte int       #(A)

$num = 2 ** 31 - 1;

print $num, "\n";                # 2147483647                      #(B)
printf "%d\n", $num;             # 2147483647                      #(C)

$num = $num + 1000;                                                #(D)
printf "%u\n", $num;             # 2147484647                      #(E)
printf "%d\n", $num;             # -2147482649  (WRONG)            #(F)
print $num, "\n";                # 2147484647                      #(G)

$num = $num * $num;                                                #(H)
printf "%d\n", $num;             # -1           (WRONG)            #(I)
printf "%u\n", $num;             # 4294967295   (WRONG)            #(J)
printf "%e\n", $num;             # 4.611690e+18                    #(K)
print $num, "\n";                # 4.61169030910072e+18            #(L)

$num = 16;                                                         #(M)
$num = $num ** 2;                                                  #(N)
print $num, "\n";                # 256                             #(O)
$num **= 0.5;                                                      #(P)
print $num, "\n";                # 16                              #(Q)
$num %= 9;                                                         #(R)
print $num, "\n";                # 7                               #(S)
$num /= 4;                                                         #(T)
print $num, "\n";                # 1.75                            #(U)
print $num++, "\n";              # 1.75                            #(V)
print ++$num, "\n";              # 3.75                            #(W)
