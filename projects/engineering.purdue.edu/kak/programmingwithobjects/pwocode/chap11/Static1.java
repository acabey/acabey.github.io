// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.4  Static Members In Java
//



//Static1.java

class X {
    public int m;                                          
    public static int n = 100;                             
    public static final int p = 50;                               //(A)
    public static final int q = init();                           //(B)

    public X( int mm ) { m = mm; }                         

    public static int init() { return 200; }
}

class Test {
    public static void main(String[] args)
    {
        System.out.println( X.n );        // 100                  //(C)
        System.out.println( X.q );        // 200 
    
        X xobj_1 = new X( 20 );                                   //(D)
        System.out.println(xobj_1.m + " " + xobj_1.n);   //20 100 
                                                         
        X xobj_2 = new X( 40 );                         
        System.out.println(xobj_2.m + " " + xobj_2.n);   //40 100  
                                                         
        X.n = 1000;                                               //(E) 
  
        System.out.println(xobj_1.m + " " + xobj_1.n);   //20 1000   
                                                        
        System.out.println(xobj_2.m + " " + xobj_2.n);   //40 1000   
                                                        
    }
}