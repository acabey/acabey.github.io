// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.9  User-Defined Conversions
//



//UserConv.cc

#include <iostream>
using namespace std;

class Point3D;

class Point2D {
    int x;
    int y;
public:
    Point2D( int p, int q ) : x(p), y(q) {}
    operator Point3D();                                           //(A)       
};

class Point3D {
    int x;
    int y;
    int z;
public:
    Point3D( int p, int q, int r ) : x(p), y(q), z(r) {}
    friend ostream& operator<<( ostream& os, const Point3D& point );
};

ostream& operator<<( ostream& os, const Point3D& point )
{
    os << "(" << point.x <<", " << point.y << ", " << point.z << ")";
    return os;
}

inline Point2D::operator Point3D() { return Point3D( x, y, 0 ); } //(B)

int main()
{
    Point2D point2D( 3, 4 );                                      //(C)
    cout << point2D << endl;                                      //(D)
                        // (3, 4, 0) using Point3D's operator<<       
    return 0;
}
