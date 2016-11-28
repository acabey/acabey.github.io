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



//PrintObj.cc

#include <iostream>
#include <string>
using namespace std;

class User {      
    string name;
    int age;
public:
    User( string str, int yy ) { name = str;  age = yy; } 

    friend ostream& operator<<(ostream& os, const User& user) {   //(C)
        os << "Name: " << user.name << " Age: " << user.age << endl;
        return os;
    }
};

int main()
{
    User us( "Zaphod", 119 );
    cout << us << endl;          // Name: Zaphod  Age: 119        //(D)
    return 0;
}
