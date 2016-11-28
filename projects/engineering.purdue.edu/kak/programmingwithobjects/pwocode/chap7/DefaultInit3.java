// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.3.1  Is Default Initialization Affected by Default Values for Class Members?
//




//DefaultInit3.java

class User {
    public String name = "John Doe";                              //(A)
    public int age = 25;                                          //(B)

    public String toString() { return name + "  "  + age; }
}

class Test {
    public static void main( String[] args ) {
        User u = new User();                                      //(C)
        System.out.println( u );      // John Doe  25             //(D)
    }
}