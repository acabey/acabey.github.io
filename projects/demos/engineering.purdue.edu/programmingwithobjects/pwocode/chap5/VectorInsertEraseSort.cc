// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.1.1.1 -- List Operations on Vectors
//



//VectorInsertEraseSort.cc

#include <iostream>
#include <vector>
#include <algorithm>   // for the find() and sort() generic functions
using namespace std;

void print( vector<int> );

int main()
{
    vector<int> vec(5);                                           //(A)
    print( vec );                              // 0 0 0 0 0

    vector<int>::iterator p = vec.begin();                        //(B)

    cout << *p << endl;                        // 0               //(C)
  
    vec.insert( vec.begin(), 9 );                                 //(D)
    print( vec );                              // 9 0 0 0 0 0

    cout << *p << endl;                        // ERROR           //(E)

    p = vec.begin();                                              //(F)
    cout << *p << endl;                        // 9               //(G)

    vec.erase( vec.begin() );                                     //(H)
    print( vec );                              // 0 0 0 0 0
  
    vec.insert( vec.begin() + 2, 8 );                             //(I)
    print( vec );                              // 0 0 8 0 0 0
  
    vec.erase( vec.begin() + 2 );                                 //(J)
    print( vec );                              // 0 0 0 0 0
  
    vec.insert( vec.end(),  7 );                                  //(K)
    print( vec );                              // 0 0 0 0 0 7

    vec.erase( vec.end() - 1 );                                   //(L)
    print( vec );                              // 0 0 0 0 0
  
    vec.insert( vec.begin() + 3, 6 );                             //(M)
    print( vec );                              // 0 0 0 6 0 0
    vec.erase( find( vec.begin(), vec.end(), 6 ) );               //(N)
    print( vec );                              // 0 0 0 0 0
  
    vec.insert( vec.begin() + 1, 3 );                             //(O)
    vec.insert( vec.begin() + 5, 3 );                             //(P)
    print( vec );                              // 0 3 0 0 0 3 0
    vec.erase( find( vec.begin(), vec.end(), 3 ) );               //(Q)
    vec.erase( find( vec.begin(), vec.end(), 3 ) );               //(R)
    print( vec );                              // 0 0 0 0 0
  
    vec[0] = 23;                                                  //(S)
    vec[1] = 2;
    vec[2] = 16;
    vec[3] = 45;
    vec[4] = 16;
    print( vec );                              // 23 2 16 45 16

    sort( vec.begin(), vec.end() );                               //(T)
    print( vec );                              // 2 16 16 23 45

    return 0;
}

void print( vector<int> v ) {
    vector<int>::iterator p = v.begin();
    while ( p != v.end() )
        cout << *p++ << "  ";
    cout << endl;
}
