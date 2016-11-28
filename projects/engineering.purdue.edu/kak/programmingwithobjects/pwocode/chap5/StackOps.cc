// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.1.4 ---- Stack
//



//StackOps.cc

#include <iostream>                          // for cout
#include <string>
#include <stack>                 
#include <vector>
using namespace std;

int main()
{
    stack< string, vector<string> > s;      

    s.push( "me" );
    s.push( "to" );
    s.push( "talk" );

    while ( !s.empty() ) {
        cout << s.top() << " ";              // talk to me
        s.pop();
    }

    return 0;
}
