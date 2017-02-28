// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.1 -- Defining A Class In C++
//



//User1.cc

#include <iostream>
#include <string>
using namespace std;

class User {                           
    string name;
    int age;
public:  
    User( string str, int yy ) { name = str;  age = yy; } 
    
    void print() { 
        cout << "name: " << name << "  age: "  << age << endl; 
    }
};

int main()
{
    User u( "Zaphod", 119 );
    u.print();
    return 0;
}
