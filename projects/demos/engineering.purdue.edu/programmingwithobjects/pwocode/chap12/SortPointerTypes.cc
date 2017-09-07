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



//SortPointerTypes.cc

#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

class Cat { 
    string name; 
    int age; 
public:
    class Cat_Comparator {
    public:
        bool operator() ( const Cat* x1, const Cat* x2 ) const {
             return x1->age < x2->age;
        }
    };
    Cat( string nam, int yy) : name(nam), age( yy ) {}
    friend ostream& operator<< ( ostream& os, const Cat& c ) {
        os << c.name << " " << c.age;
    }
    friend bool Cat_Comparator::operator()( const Cat* x1, 
                                            const Cat* x2 ) const;
};

template<class T> void print( vector<T> );


int main()
{
    Cat* kitty1 = new Cat( "cuddles", 3 );
    Cat* kitty2 = new Cat( "tabby", 8 );
    Cat* kitty3 = new Cat( "socks", 6 );

    vector<Cat*> kittyVec;          

    kittyVec.push_back( kitty1 );
    kittyVec.push_back( kitty2 );
    kittyVec.push_back( kitty3 );

    sort( kittyVec.begin(), kittyVec.end(), Cat::Cat_Comparator() );
    print( kittyVec );               // cuddles 3   socks 6   tabby 8

    return 0;
}

template<class T> void print( vector<T> vec ) {
    typedef typename vector<T>::const_iterator CI;   
    for ( CI iter = vec.begin(); iter != vec.end(); iter++ )     
        cout << **iter << "  ";
    cout << endl;
}
