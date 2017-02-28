// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.7 -- Creating Print Representations For Objects
//




//PrintObj.java

class User {      
    private String name;
    private int age;

    public User( String str, int yy ) { name = str;  age = yy; } 

    public String toString(){                                     //(A)
        return "Name: " + name + " Age: " + age;
    }
}

class Test {
    public static void main( String[] args ) {
        User us = new User( "Zaphod", 119 );
        System.out.println( us );    // Name: Zaphod  Age: 119    //(B)
    }
}
