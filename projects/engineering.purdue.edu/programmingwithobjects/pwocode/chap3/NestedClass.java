// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.16 - Nested Types
//




//NestedClass.java

class X {                                                         //(A)
    static class Y{                                               //(B)
        private int m;
        public Y( int mm ) { m = mm; }      
        public void printY(){               
            System.out.println( "m of nested class object: " + m );
        }
    }

    private Y yref;                         

    public X() { yref = new Y( 100 ); }     

    Y get_yref(){ return yref; }            
}

class Test {
    public static void main( String[] args ) {
        X x = new X();
        x.get_yref().printY();   // m of nested class object: 100 
    }
}
