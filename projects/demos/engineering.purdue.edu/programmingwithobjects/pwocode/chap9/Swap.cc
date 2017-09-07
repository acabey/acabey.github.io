// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.3.2  Passing a Class Type Argument by Value of Object Reference
//



//Swap.cc

#include <iostream>
#include <string>
using namespace std;

class User {
public:  
    string name; 
    int age; 
    User(string nm, int a) {name=nm; age=a;} 
};

void swap( User&, User& );

int main()
{
    User u1("Xeno", 95);                                          //(A)
    User u2("Yuki", 98);                                          //(B)
    swap( u1, u2 );                                               //(C)
    cout << u1.name  << endl;                   // Yuki
    cout << u2.name  << endl;                   // Xeno
    return 0;
}

void swap(User& s, User& t) {                                     //(D)
    User temp = s;
    s = t;
    t = temp;
}
