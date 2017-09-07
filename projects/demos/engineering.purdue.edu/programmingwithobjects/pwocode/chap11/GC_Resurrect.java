// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.9  Object Destruction In Java
//



//GC_Resurrect.java

class X {
    int id;
    static int nextId = 1;
    static X[] staticArr = new X[10000];                          //(A)

    //constructor:
    public X() { id = nextId++; }

    protected void finalize() throws Throwable {
        if ( id%1000 == 0 )
            System.out.println("Finalization of X object, id = " + id);     
        super.finalize();
        X resurrect = this;                                       //(B)
        putItAway( resurrect );                                   //(C)
    }

    public void putItAway( X xobj ) { staticArr[ id ] = this; }
}

class Test {
    public static void main( String[] args ) {
        X[] xarray = new X[ 10000 ];
        for (int i = 0; i < 10000; i++ ) 
            xarray[i] = new X();
        xarray = null;
        System.gc();
    }
}