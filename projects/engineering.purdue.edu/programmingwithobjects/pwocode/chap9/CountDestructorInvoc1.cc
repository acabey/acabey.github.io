// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.15  Homework
//



//CountDestructorInvoc1.cc

#include <iostream>
using namespace std;

class X {
    int n;
public:
    X( int nn ) : n(nn) {} 
    ~X() { 
        cout << "destructor invoked for X obj with n= " << n 
             << endl; 
    }
};

void g( X x ) {}                                             //(A)

int main() {
    X xobj( 100 );
    g( xobj );                                               //(B)
    return 0;
}
