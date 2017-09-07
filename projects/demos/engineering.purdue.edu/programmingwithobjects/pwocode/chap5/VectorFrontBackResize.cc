// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classess
//
// Section:     Section 5.1.1 -- Vector
//



//VectorFrontBackResize.cc

#include <iostream>
#include <vector>    
using namespace std;

int sum( vector<int> vec ) {
    int result = 0;
    vector<int>::iterator p = vec.begin();  
    while ( p != vec.end() ) result += *p++;
    return result;
}

int main()
{
    vector<int> v1(100);                                          //(A)
    cout << v1.size() << endl;               // 100
    cout << sum( v1 ) << endl;               // 0

    v1.push_back( 23 );                                           //(B)
    cout << v1.size() << endl;               // 101               
    cout << sum( v1 ) << endl;               // 23

    v1.reserve( 1000 );                                           //(C)
    cout << v1.capacity() << endl;           // 1000  
    cout << v1.size() << endl;               // 101               
    cout << v1[900] << endl;                 // undefined
    cout << sum( v1 ) << endl;               // 23

    cout << v1.front() << endl;              // 0                 //(D)
    cout << v1.back() << endl;               // 23                //(E)

    v1.pop_back();   

    cout << v1[ v1.size() - 1 ] << endl;     // 0                 //(F)

//    vector<int>::iterator p = &v1[50];                            //(G)
//    cout << *p << endl;                      // 0

    vector<int> v2(150, 2);                                       //(H)
    cout << sum( v2 ) << endl;               // 300

    v2.resize( 500 );                                             //(I)
    cout << v2.size() << endl;               // 500
    cout << v2[150] << endl;                 // 0                 //(J)

    v2.clear();                                                   //(K)
    cout << v2.empty() << endl;              // true
    cout << v2.capacity() << endl;           // 500
    cout << v2.size() << endl;               // 0

    v2.resize( 0 );                                               //(L)
    cout << v2.capacity() << endl;           // 500
    cout << v2.size() << endl;               // 0

    return 0;
}
