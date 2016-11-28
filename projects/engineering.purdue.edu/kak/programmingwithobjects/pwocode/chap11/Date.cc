// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter Classes, The Rest Of The Story
//
// Section:     Section 11.3  Static Members In C++
//



//Date.cc

#include <iostream>
using namespace std;

class Date {
    int d, m, y;
    static Date today;                                            //(A)
public:
    Date( int dd = 0, int mm = 0, int yy = 0 );    
    static void setToday(int, int, int);                          //(B)
    static Date getToday() { return today; };                     //(C)
    void print() {
        cout << "day: " << d << " month: " << m 
             << " year: " << y << endl; 
    }
};

Date::Date( int dd, int mm, int yy ) {
    d = dd ? dd : today.d;
    m = mm ? mm : today.m;
    y = yy ? yy : today.y;
}

void Date::setToday( int dd, int mm, int yy ) {                   //(D)
    today = Date(dd, mm, yy);
}

Date Date::today( 31, 10, 2001 );                                 //(E)

int main()
{
    Date d1( 1, 1, 1970);
    d1.print();                 //day: 1  month: 1  year: 1970
    Date d2( 2 );
    d2.print();                 //day: 2  month: 10 year: 2001
    Date::setToday(3, 4, 2000);                                   //(F)
    Date::getToday().print();   //day: 3  month: 4  year: 2000    //(G)
    Date d3( 7 );
    d3.print();                 //day: 7  month: 4  year: 2000
    Date d4 = Date();
    d4.print();                 //day: 3  month: 4  year: 2000
    return 0;
}
