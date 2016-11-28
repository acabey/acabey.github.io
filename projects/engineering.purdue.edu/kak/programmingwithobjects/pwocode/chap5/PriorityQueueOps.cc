// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.1.6 ---- Priority Queue
//




//PriorityQueueOps.cc

#include <iostream>                  // for cout, endl
#include <string>
#include <queue>                 
using namespace std;

class Prioritize {
public:
    // As explained in Chapter 12, the overloading of the
    // '()' operator shown below makes available a function 
    // object Prioritize() that is subsequenlty supplied as 
    // the third argument to the priority_queue constructor.
    int operator() ( const pair<string, unsigned int>& p1, 
                     const pair<string, unsigned int>& p2 ) {
        return p1.second < p2.second;
    }
};

int main()
{
    priority_queue< pair< string, unsigned int >, 
        vector <pair< string, unsigned int > >, Prioritize >   pq;   

    pq.push( pair<string, int>( "go to lunch", 2) );
    pq.push( pair<string, int>( "go to bathroom", 10 ) );
    pq.push( pair<string, int>( "take a nap", 1 ) );

    while ( !pq.empty() ) {                                       //(A)
        cout << pq.top().first << endl;
        pq.pop();
    }

    return 0;
}
