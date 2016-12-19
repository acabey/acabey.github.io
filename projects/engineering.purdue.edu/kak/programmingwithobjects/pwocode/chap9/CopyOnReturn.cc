// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9 Functions And Methods
//
// Section:     Section 9.4  C++ Functions Returning Reference Types
//



//CopyOnReturn.cc

#include <iostream>
#include <string>
using namespace std;

class User {
public:  
    string name;
    int age;
    User( string nam, int yy ) { name = nam; age = yy; }
};

User f( User usr ) { return usr; }                                //(A)

int main()
{
    User u( "Xino", 120 );
    User y = f( u );                                              //(B)
    cout << y.name << endl;             // Xino
    return 0;
}