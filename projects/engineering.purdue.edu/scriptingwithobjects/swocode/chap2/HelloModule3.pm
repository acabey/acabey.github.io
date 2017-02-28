# HelloModule3.pm

package HelloModule3;

sub say_loud_hello {
    print "HELLO!!! HOW ARE YOU!!!\n";
}

sub say_soft_hello {
    print "hi dear! how are you this morning!\n";
}

sub AUTOLOAD {                                                      #(A)
    print "Message from HelloModule4:\n",                           #(B)
           "This function does not exist in HelloModule4.\n";       #(C)
}

1
