// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author: Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.1.1 - Vector
//



// VectorBasic.cc

#include <iostream>
#include <vector>                                                 //(A)
using namespace std;

void print( vector<int> );

int main()
{
    vector<int> vec;                                              //(B)

    vec.push_back( 34 );                                          //(C)
    vec.push_back( 23 );     // size is now 2
    print( vec );            // 34 23

    vector<int>::iterator p;                                      //(D)
    p = vec.begin();                                              //(E)
    *p = 68;                                                      //(F)
    *(p + 1) = 69;                                                //(G)
    //  *(p + 2) = 70;       // WRONG                             //(H)
    print( vec );            // 68 69                   
    vec.pop_back();          // size is now 1                     //(I)
    print( vec );            // 68
  
    vec.push_back(101);                                           //(J)
    vec.push_back(103);      // size is now 3                     //(K)
    // size is now 3
    int i = 0;                          
    while ( i < vec.size() )                                      //(L)
        cout << vec[i++] << "  ";         
    cout << endl;            // 68 101 103
  
    vec[0] = 1000;                                                //(M)
    vec[1] = 1001;                                                //(N)
    vec[2] = 1002;                                                //(O)
    print( vec );            // 1000 1001 1002   

    return 0;
}

void print( vector<int> v ) {
    cout << "\nvector size is: " << v.size() << endl;
    vector<int>::iterator p = v.begin();
    while ( p != v.end() )
        cout << *p++ << "  ";                        
    cout << endl << endl;
}
