// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.2.4  Passing a Class Type Argument by Value
//





//PassClassTypeByValue.cc

#include <iostream>
#include <string>
using namespace std;

class User {
public:
    string name;
    int age;
    User( string nam, int yy ) { name = nam; age = yy; }
};

void g( User );

int main()
{
    User u( "Xenon", 89 );                                        //(A)
    g(u);                                                         //(B)
    cout << u.name << "  " << u.age << endl;  // Xenon 89
    return 0;
}

void g( User v ) {                                                //(C)
    v.name = "Yukon";
    v.age = 200;
}
