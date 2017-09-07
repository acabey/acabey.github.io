// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A CLass And Some Other Key Ideas
//
// Section:     Section 3.1 -- Defining A Class In C++
//




//User2.cc

#include <iostream>
#include <string>
using namespace std;

class User {                           
    string name;
    int age;
public:  
    User( string str, int yy );                                   //(H)
    void print();                                                 //(I)
};

User::User( string str, int yy ) {                                //(J)
    name = str;  age = yy; 
}                       

void User::print() {                                              //(K)
    cout << "name: " << name  << "  age: "  << age << endl;     
}

int main()
{
    User u( "Zaphod", 119 );
    u.print();
    return 0;
}
