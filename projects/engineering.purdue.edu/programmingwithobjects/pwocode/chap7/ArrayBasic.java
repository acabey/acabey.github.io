// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.10  Arrays And Their Initialization In Java
//





//ArrayBasic.java

class User {
    String name; 
    int age;
    public User( String nam, int yy ) {
        name = nam;
        age = yy;
    }
}

class Test {
    public static void main( String[] args ) {
        User[] user_list = new User[ 4 ];
        for ( int i=0; i<user_list.length; i++ )
            System.out.print( user_list[ i ] + "  " ); 
                                       // null null null null
    }
}