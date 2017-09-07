// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.11  Sorting Class-Type Objects By Overloading The '<' Operator
//


//SortWithLessThan.cc

#include <iostream>
#include <string>
#include <list>      
using namespace std;

class Cat { 
    string name; 
    int age; 
public:
    Cat( string nam, int yy) : name(nam), age( yy ) {}
    friend ostream& operator<< ( ostream& os, const Cat& c ) {
        os << c.name << " " << c.age;
    }
    friend bool operator<( const Cat& x1, const Cat& x2 );
};

bool operator<( const Cat& x1, const Cat& x2 ) {                  //(A)     
    return x1.age < x2.age;
}

template<class T> void print( list<T> );

int main()
{
    Cat kitty1( "socks", 6 );
    Cat kitty2( "cuddles", 3 );
    Cat kitty3( "tabby", 8 );

    list<Cat> kittyList;          

    kittyList.push_back( kitty1 );
    kittyList.push_back( kitty2 );
    kittyList.push_back( kitty3 );


    kittyList.sort();
    print( kittyList );

    return 0;
}

template<class T> void print( list<T> li ) {
    typedef typename list<T>::const_iterator CI;   
    for ( CI iter = li.begin(); iter != li.end(); iter++ )     
        cout << *iter << "  ";
    cout << endl;
}
