# PackageConstDestr.pm

package PackageConstDestr;

print "executing the main of this module\n";

BEGIN {
    print "executing the first BEGIN subroutine\n";
}

BEGIN {
    print "executing the second BEGIN subroutine\n";
}

END {
    print "executing the first END subroutine\n";
}

END {
    print "executing the second END subroutine\n";
}

CHECK {
    print "executing the first CHECK soubroutine\n";
}

CHECK {
    print "executing the second CHECK soubroutine\n";
}

INIT {
    print "executing the first INIT subroutine\n";
}

INIT {
    print "executing the second INIT subroutine\n";
}

1;
