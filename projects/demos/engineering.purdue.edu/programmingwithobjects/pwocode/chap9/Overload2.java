// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.15  Homework
//




//Overload2.java

class Employee { String name; }
class Manager extends Employee { int level; }

class Test {
    // first foo:
    static void foo( Employee e1, 
                       Employee e2, double salary ) { 
        System.out.println( "first foo" ); 
    }

    // second foo:
    static void foo( Employee e, 
                            Manager m, int salary ) { 
        System.out.println( "second foo" ); 
    }

    // third foo:
    static void foo( Manager m, Employee e, int salary ) {
        System.out.println( "third foo" ); 
    }

    public static void main( String[] args )
    {
        Employee emp = new Employee();
        Manager man = new Manager();

        foo( emp, man, 100.25 );                             //(A)
        foo( emp, emp, 100 );                                //(B)
        foo( man, man, 100.25 );                             //(C)
    }
}