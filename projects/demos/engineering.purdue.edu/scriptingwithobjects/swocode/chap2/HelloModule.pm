# HelloModule.pm

package HelloModule;                                                #(A)

sub say_loud_hello {                                                #(B)
    print "HELLO!!! HOW ARE YOU!!!\n";
}

sub say_soft_hello {                                                #(C)
    return "hi dear! how are you this morning!\n";
#    print "hi dear how are you this morning";
}

1                                                                   #(D)
