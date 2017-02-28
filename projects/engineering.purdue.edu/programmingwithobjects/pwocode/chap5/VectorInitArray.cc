// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ----  Using the Container Classes
//
// Section:     Section 5.1.1.3 ----  Using an Array to Initialize a Vector
//



//VectorInitArray.cc

#include <iostream>
#include <vector>
using namespace std;

void print( vector<int> );

int main()
{
    int data[] = {11, 12, 23, 34};                   
    int size = sizeof( data ) / sizeof( data[0] );   
    vector<int> vec( data, &data[ size ] );          
    print( vec );                                 // 11 12 23 34
    return 0;
}  

void print( vector<int> vec ) {
    vector<int>::iterator p = vec.begin();
    while ( p < vec.end() )
      cout <<  *p++ << " ";
    cout << endl;
}
