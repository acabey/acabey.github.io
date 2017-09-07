// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.4 -- Defining A Subclass In C++
//



//Polymorph.cc

#include <iostream>
#include <string>
using namespace std;

class User {
    string name; 
    int age; 
public:
    User(string nm, int a) {name=nm; age=a;} 
    virtual void print() {                                        //(E)
        cout << "Name: " << name << "  Age: " << age; 
    }
};

class StudentUser : public User {                                 
    string schoolEnrolled; 
public:  
    StudentUser(string nam, int y, string school) : User(nam, y){ 
        schoolEnrolled = school; 
    }
    void print() {                                                //(F)
        User::print();                                            
        cout << "  School Enrolled:  " << schoolEnrolled;
    }
};

int main()
{
    User* users[3];                                               //(G)

    users[0] = new User( "Buster Dandy", 34 );                    //(H)
    users[1] = new StudentUser("Missy Showoff", 25, "Math");      //(I)
    users[2] = new User( "Mister Meister", 28 );                  //(J)

    for (int i=0; i<3; i++) {                                     //(K)
        users[i]->print();                                        //(L)
        cout << endl;
    }
    // this program has a memory leak; ignore it for now          //(M)
    return 0;
}
