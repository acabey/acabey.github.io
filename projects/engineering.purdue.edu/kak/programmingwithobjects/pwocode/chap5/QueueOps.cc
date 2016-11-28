// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ----  Using the Container Classes
//
// Section:     Section 5.1.5 ---- Queue
//




//QueueOps.cc

#include <iostream>                        // for cout
#include <string>
#include <queue>                 
using namespace std;

int main()
{
    queue<string> q;      

    q.push( "roses" );
    q.push( "are" );
    q.push( "red" );

    while ( !q.empty() ) {
        cout << q.front() << " ";          // roses are red
        q.pop();
    }

    return 0;
}
