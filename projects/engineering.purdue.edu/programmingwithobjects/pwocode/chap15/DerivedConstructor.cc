// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.2  Constructors For Derived Classes In C++
//



//DerivedConstructor.cc

#include <iostream>
#include <string>
using namespace std;

class User {                           // BASE
    string name; 
    int age; 
public:
    User( string nm, int a ) { name = nm; age = a;} 
    void print(){cout << "Name: " << name << "   Age: " << age;}
};

class StudentUser : public User {      // DERIVED
    string schoolEnrolled; 
public:  
    StudentUser( string nam, int y, string school )
                   : User( nam, y ) {                             //(A)
        schoolEnrolled = school;
    }
    void print() {
        User::print();
        cout << "   School Enrolled:  " << schoolEnrolled << endl; 
    }
};

int main()
{
    StudentUser student( "Maura", 20, "ece" );
    student.print();      
         // Name: Maura  Age: 20  School Enrolled: ece
    return 0;
}
